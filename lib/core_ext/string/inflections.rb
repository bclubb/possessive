require 'possessive/inflector/methods'

class String
  def possessive(locale = nil)
    Possessive::Inflector.possessive(self, locale || I18n.locale)
  end
end