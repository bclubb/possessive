# Inspired by ActiveSupport::Inflector
module Possessive
  # The Inflector transforms words into their possessive form.
  # The default inflections for possessive form are kept in inflections.rb.
  module Inflector
    extend self

    # Returns the possessive form of the word in the string.
    #
    # If passed an optional +locale+ parameter, the possessive form of the word
    # will be determined using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   'Brian'.possessive           # => "Brian’s"
    #   'Steelers'.possessive        # => "Steelers’"
    #   'class'.possessive           # => "class’s"
    #   'fish'.possessive            # => "fishes’"
    #   'Brian'.possessive(:de)      # => "Brians"
    def possessive(word, locale = :en)
      result = word.to_s.dup

      if word.empty?
        result
      else
        inflections(locale).possessives.each do |(rule, replacement)|
          break if result.sub!(rule, replacement)
        end
        result
      end
    end
  end
end