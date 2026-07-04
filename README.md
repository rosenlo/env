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
