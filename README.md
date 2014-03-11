# possessive

Rails gem that lets you get a possessive form of a string. Supports localization in the style of ActiveSupport::Inflector.

## Example

    "Brian".possessive    # => Brian's
    "Sooners".possessive  # => Sooners'

## Install

    # Gemfile
    gem "possessive" 

## Localization

Sample configuration for German:

    # config/initializers/inflections.rb
    Possessive::Inflector.inflections(:de) do |inflect|
      inflect.possessive /$/, 's'
      inflect.possessive /(ch|chs|sch|ss|x|z)$/i, '\1es'
    end

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (If you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull.)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2014 Brian Clubb, Robert Wünsch. See LICENSE for details.
