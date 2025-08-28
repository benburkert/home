switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
end



if status is-interactive
    alias home "git --work-tree=$HOME --git-dir=$HOME/.home"
    alias home-brew "brew bundle install --cleanup --file=$HOME/Brewfile"
    alias vim nvim
    alias vi nvim

    set -x EDITOR nvim
    set -x VISUAL nvim
end
