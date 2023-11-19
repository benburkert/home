source ~/.config/fish/functions/asdf.fish

function go_module
    if set -l go_list (command go list 2>/dev/null)
        echo $go_list
    end
end

function go_version
    if count (go_module) >/dev/null
        asdf current golang | read -l _1 go_version _3
        echo $go_version
        if set -l go_version (asdf_version_for go)
            echo $go_version
        end
    end
end
