function nodejs_version
    if test -f package.json
        if set -l nodejs_version (asdf_version_for nodejs)
            echo $nodejs_version
        end
    end
end
