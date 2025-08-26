source ~/.config/fish/functions/nodejs.fish
source ~/.config/fish/functions/python.fish
source ~/.config/fish/functions/ruby.fish

function fish_prompt
    # This prompt shows:
    # - the current path (with prompt_pwd)
    # - the current git status, if any, with custom git query
    # - the current go version, if the working dir is in a go project
    # - the current nodejs version, if the working dir is the root of a nodejs project
    # - date +%X
    # - current background jobs, if any

    set -l laststatus $status
    set -l retc red
    test $laststatus = 0; and set retc green

    set -l git_info
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        set git_branch (set_color -o blue)"$git_branch"
        set -l git_status
        if not command git diff-index --quiet HEAD 2>/dev/null --
            if set -l count (command git rev-list --count --left-right $upstream...HEAD 2>/dev/null)
                echo $count | read -l ahead behind
                if test "$ahead" -gt 0
                    set git_status "$git_status"(set_color red)⬆
                end
                if test "$behind" -gt 0
                    set git_status "$git_status"(set_color red)⬇
                end
            end
            for i in (git status --porcelain | string sub -l 2 | sort | uniq)
                switch $i
                    case "."
                        set git_status "$git_status"(set_color green)✚
                    case " D"
                        set git_status "$git_status"(set_color red)✖
                    case "*M*"
                        set git_status "$git_status"(set_color green)✱
                    case "*R*"
                        set git_status "$git_status"(set_color purple)➜
                    case "*U*"
                        set git_status "$git_status"(set_color brown)═
                    case "??"
                        set git_status "$git_status"(set_color red)≠
                end
            end
        else
            set git_status (set_color green):
        end
        set git_info " $git_status$git_branch"
    end

    function _prompt_wrapper
        set clr $argv[1]
        set -l field_name $argv[2]
        set -l field_value $argv[3]

        set_color normal
        set_color white
        echo -n '❙'
        test -n "$field_name"
        and echo -n "$field_name "
        set_color $clr
        echo -n $field_value
        set_color -o white
    end

    set_color normal
    set_color white
    echo -n '┬─'
    echo -n '❰'

    # PWD

    set_color yellow
    echo -n (prompt_pwd)

    # git

    test -n "$git_info"
    and _prompt_wrapper yellow '' $git_info

    # go

    set -l go_version (go_version)
    test -n "$go_version"
    and _prompt_wrapper blue '' $go_version

    # nodejs

    set -l nodejs_version (nodejs_version)
    test -n "$nodejs_version"
    and _prompt_wrapper yellow '' $nodejs_version

    # python

    set -l python_version (python_version)
    test -n "$python_version"
    and _prompt_wrapper blue '' $python_version

    # ruby

    set -l ruby_version (ruby_version)
    test -n "$ruby_version"
    and _prompt_wrapper red '' $ruby_version

    # date

    _prompt_wrapper green "" (date +%X)

    # status

    _prompt_wrapper $retc "" $laststatus

    # EOL
    set_color white
    echo -n '❱'
    echo

    # Background jobs
    set_color normal

    for job in (jobs)
        set_color white
        echo -n '│ '
        set_color brown
        echo $job
    end

    set_color normal
    set_color white
    echo -n '╰─>'
    set_color -o red
    echo -n '$ '
    set_color normal
end
