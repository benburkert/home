function asdf_version_for
    asdf current $argv[1] 2>/dev/null | read -l _1 _version _3
    test -n "$_version"
    and echo $_version
end
