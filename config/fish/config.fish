if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    alias v="neovide.exe --wsl"
    alias cat="bat"
    alias ls="eza -la"
    alias gst="git status"
    alias gdf="git diff"
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
