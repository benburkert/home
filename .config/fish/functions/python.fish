function python_version
    if test -f requirements.txt; or test -f pyproject.toml
        mise current python --quiet
    end
end
