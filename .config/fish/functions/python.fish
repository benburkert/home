source ~/.config/fish/functions/asdf.fish

function python_version
    if test -f requirements.txt; or test -f pyproject.toml
        if set -l python_version (asdf_version_for python)
            echo $python_version
        end
    end
end
