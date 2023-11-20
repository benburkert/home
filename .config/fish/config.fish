switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
end

if status is-interactive
    alias home "git --work-tree=$HOME --git-dir=$HOME/.home"
    alias vim "nvim"
    alias vi "nvim"

    set -x EDITOR vim
    set -x VISUAL vim
end
