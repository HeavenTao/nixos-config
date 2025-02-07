if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    alias v="neovide.exe --wsl"
    alias cat="bat"
    alias ls="eza -la"
end
