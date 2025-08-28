function ruby_version
    if test -f Gemfile; or test -f '*.gemspec'
        mise current ruby --quiet
    end
end
