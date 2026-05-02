function ruby_version
    if test -f Gemfile; or count *.gemspec >/dev/null
        mise current ruby --quiet
    end
end
