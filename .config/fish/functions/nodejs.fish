function nodejs_version
    if test -f package.json
        mise current nodejs --quiet
    end
end
