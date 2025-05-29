if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    alias v="neovide.exe --wsl"
    alias cat="bat"
    alias ls="eza -la"
    alias gst="git status"
    alias gdf="git diff"
    alias log="journalctl -o short-full"
    alias tlog="journalctl -o short-full --since=(date +%Y-%m-%d)"
    alias tn="tmux new-session"
    alias tl="tmux list-session"
    alias ta="tmux attach-session"
    set -Ux MANPAGER 'nvim +Man!'
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
