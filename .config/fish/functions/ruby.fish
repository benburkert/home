
source ~/.config/fish/functions/asdf.fish

function ruby_version
    if test -f Gemfile ; or test -f '*.gemspec'
        if set -l ruby_version (asdf_version_for ruby)
            echo $ruby_version
        end
    end
end
