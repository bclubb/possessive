require 'inflector/methods'

class String
  def possessive(locale = :en)
    Possessive::Inflector.possessive(self, locale)
  end
end