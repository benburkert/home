function go_module
    if set -l go_list (command go list 2>/dev/null)
        echo $go_list
    end
end

function go_version
    if count (go_module) >/dev/null
        mise current go --quiet
    end
end
