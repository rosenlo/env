# env

Personal environment config — vim, zsh, and dotfiles.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/rosenlo/env/master/install.sh | bash
```

## Structure

| File | Symlinked to |
|------|-------------|
| `.vimrc` | `~/.vimrc` |
| `.zshrc` | `~/.zshrc` |
| `claude/statusline.sh` | `~/.claude/statusline.sh` |

## Vim Shortcuts

| Key | Mode | Description |
|-----|------|-------------|
| `,e` | normal | quit current window |
| `,E` | normal | quit all windows |
| `,n` | normal | toggle NERDTree |
| `,z` | normal | find usages |
| `,b` | normal | insert ipdb breakpoint |
| `,g` | normal | go to declaration |
| `,s` | visual | sort selection |
| `,t` | normal | toggle Tagbar |

## Claude Code status line

`claude/statusline.sh` renders model, tok/s, cost, turn time (`dur`), session time (`total`), cache hit rate and context % below the prompt
(modelled on [opencode-status-bar](https://github.com/rosenlo/opencode-status-bar)). Needs `jq`. Enable it in `~/.claude/settings.json`:

```json
{ "statusLine": { "type": "command", "command": "~/.claude/statusline.sh" } }
```

Edit `SHOW` at the top of the script to pick and order segments. tok/s is the end-to-end rate of the last
step (includes time to first token), derived from the transcript.
