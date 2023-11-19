function nodejs_version
    if test -f package.json
        asdf current nodejs | read -l _1 nodejs_version _3
        echo $nodejs_version
    end
end
