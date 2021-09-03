# tmuxline

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'jtr860830/tmuxline'
```

Hit `prefix + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

```
$ git clone https://github.com/jtr860830/tmuxline.git /a/path/you/choose
```

Add this line to the bottom of `.tmux.conf`:

```
run-shell /a/path/you/choose tmuxline.tmux
```

Reload TMUX environment (type this in terminal)
```
$ tmux source-file ~/.tmux.conf
```
### License

[MIT](LICENSE)
