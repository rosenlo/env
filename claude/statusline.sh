#!/bin/bash
# Claude Code status line, modelled on rosenlo/opencode-status-bar.
# Segments (edit SHOW to reorder/remove): model tps cost dur cache ctx
SHOW="model tps cost dur cache ctx"

input=$(cat)
j() { printf '%s' "$input" | jq -r "$1 // empty" 2>/dev/null; }

model=$(j '.model.display_name')
cost=$(j '.cost.total_cost_usd')
dur_ms=$(j '.cost.total_duration_ms')
transcript=$(j '.transcript_path')

# Last assistant message usage + the timestamp of what preceded it, from the transcript tail.
tps="" cache="" ctx=""
if [ -n "$transcript" ] && [ -f "$transcript" ]; then
  read -r out_tok in_tok cr_tok cc_tok dur_s < <(
    tail -n 200 "$transcript" | jq -rs '
      def ms: (.[0:19] + "Z" | fromdateiso8601) * 1000 + ((.[20:23] // "0") | tonumber);
      [ .[] | select(.type=="assistant" and .message.usage != null and (.isSidechain|not)) ] as $a
      | if ($a|length)==0 then empty else
          ($a[-1]) as $l
          | ([ $a[] | select(.message.id == $l.message.id) ] | first | .timestamp) as $first
          | ([ .[] | select(.type=="user" and .timestamp != null and .timestamp < $first) ] | last | .timestamp // "") as $prev
          | [ $l.message.usage.output_tokens // 0,
              $l.message.usage.input_tokens // 0,
              $l.message.usage.cache_read_input_tokens // 0,
              $l.message.usage.cache_creation_input_tokens // 0,
              (if $prev == "" then 0 else (($l.timestamp|ms) - ($prev|ms)) / 1000 end) ] | @tsv
        end' 2>/dev/null
  )
  if [ -n "$out_tok" ]; then
    total_in=$((in_tok + cr_tok + cc_tok))
    [ "$total_in" -gt 0 ] && cache=$(awk -v r="$cr_tok" -v t="$total_in" 'BEGIN{printf "%.0f%%", r*100/t}')
    ctx_used=$((total_in + out_tok))
    # End-to-end rate for the last turn step (includes time to first token); ignore sub-0.5s steps.
    tps=$(awk -v o="$out_tok" -v d="$dur_s" 'BEGIN{if (d >= 0.5 && o > 0) printf "%.1f", o/d}')
  fi
fi

# Context percent: prefer Claude Code's own figure, else used tokens / window size.
ctx_pct=$(j '.context_window.used_percentage')
if [ -n "$ctx_pct" ]; then
  ctx=$(printf '%.0f%%' "$ctx_pct")
elif [ -n "$ctx_used" ]; then
  win=$(j '.context_window.context_window_size')
  if [ -z "$win" ]; then
    case "$(j '.model.id')" in *1m*|*1M*) win=1000000 ;; *) win=200000 ;; esac
  fi
  ctx=$(awk -v u="$ctx_used" -v w="$win" 'BEGIN{printf "%.0f%%", u*100/w}')
fi

fmt_dur() {
  local s=$(($1 / 1000))
  if [ "$s" -ge 3600 ]; then printf '%dh%02dm' $((s / 3600)) $((s % 3600 / 60))
  elif [ "$s" -ge 60 ]; then printf '%dm%02ds' $((s / 60)) $((s % 60))
  else printf '%ds' "$s"; fi
}

dim=$'\033[2m'; rst=$'\033[0m'; cyan=$'\033[36m'
parts=()
for seg in $SHOW; do
  case $seg in
    model) [ -n "$model" ] && parts+=("${cyan}${model}${rst}") ;;
    tps)   [ -n "$tps" ] && parts+=("⚡ ${tps} tok/s") ;;
    cost)  [ -n "$cost" ] && parts+=("$(printf '$%.4f' "$cost")") ;;
    dur)   [ -n "$dur_ms" ] && parts+=("⏱ $(fmt_dur "${dur_ms%.*}")") ;;
    cache) [ -n "$cache" ] && parts+=("cache ${cache}") ;;
    ctx)   [ -n "$ctx" ] && parts+=("ctx ${ctx}") ;;
  esac
done

sep=" ${dim}·${rst} "
out=""
for p in "${parts[@]}"; do out="${out:+$out$sep}$p"; done
printf '%s\n' "$out"
