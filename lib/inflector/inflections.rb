# Inspired by ActiveSupport::Inflector
module Possessive
  module Inflector
    extend self

    # A singleton instance of this class is yielded by Inflector.inflections,
    # which can then be used to specify additional inflection rules. If passed
    # an optional locale, rules for other languages can be specified. The
    # default locale is <tt>:en</tt>. Only rules for English are provided.
    #
    #   ActiveSupport::Inflector.inflections(:en) do |inflect|
    #     inflect.possessive /(sh)$/i, '\1es’'
    #     inflect.possessive /(ss)$/i, '\1’s'
    #   end
    #
    # Later rules override previous rules.
    class Inflections
      @__instance__ = {}

      def self.instance(locale = :en)
        @__instance__[locale] ||= new
      end

      attr_reader :possessives

      def initialize
        @possessives = []
      end

      # Specifies a possessive form of a string by a regular expression rule or
      # by a string mapping. When using a regular expression based replacement,
      # the normal possessive form is called after the replacement. When a
      # string is used, the possessive form should be specified as desired (example:
      # 'The name', not 'the_name').
      #
      #   possessive /$/, '’s'
      #   possessive 'it', 'its'
      def possessive(rule, replacement)
        @possessives.insert(0, [rule, replacement])
      end

      # Clears the loaded inflections.
      def clear
        @possessives = []
      end
    end

    # Yields a singleton instance of Inflector::Inflections so you can specify
    # additional inflector rules. If passed an optional locale, rules for other
    # languages can be specified. If not specified, defaults to <tt>:en</tt>.
    # Only rules for English are provided.
    #
    #   Possessive::Inflector.inflections(:en) do |inflect|
    #     inflect.uncountable 'rails'
    #   end
    def inflections(locale = :en)
      if block_given?
        yield Inflections.instance(locale)
      else
        Inflections.instance(locale)
      end
    end
  end
end