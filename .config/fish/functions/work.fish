function work -a session
    if string length --quiet $TMUX
        return
    end

    if not string length --quiet $session
        set -f session solo
    end

    command tmux has-session -t $session 2>/dev/null
    if test $status = 0
        exec tmux attach-session -t $session
    end

    if test $session = solo
        exec tmux new-session -s $session
    end

    exec upterm host --force-command "tmux attach -t $session" -- tmux new-session -s $session
end
