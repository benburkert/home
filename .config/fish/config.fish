switch (uname)
    case Darwin
        # fish_add_path /opt/homebrew/bin

        # set -g fish_user_paths ~/.asdf/bin /opt/homebrew/bin

        set -x PATH $HOME/.asdf/shims /opt/homebrew/bin $PATH
end



if status is-interactive
    alias home "git --work-tree=$HOME --git-dir=$HOME/.home"
    alias vim nvim
    alias vi nvim

    set -x EDITOR nvim
    set -x VISUAL nvim
end
