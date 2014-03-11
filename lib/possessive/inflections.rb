# encoding: utf-8
require 'possessive/inflector/inflections'

#--
# Defines the standard inflection rules. These are the starting point for
# new projects and are not considered complete. The current set of inflection
# rules is frozen. This means, we do not change them to become more complete.
# This is a safety measure to keep existing applications from breaking.
#++
Possessive::Inflector.inflections(:en) do |inflect|
  inflect.possessive /$/, '’s'
  inflect.possessive /([^’]s)$/i, '\1’'
  inflect.possessive /(sh)$/i, '\1es’'
  inflect.possessive /(ss)$/i, '\1’s'
  inflect.possessive 'it', 'its'
end