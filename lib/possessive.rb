# encoding: utf-8

String.class_eval do
  def possessive
    return self if self.empty?
    self + ('s' == self[-1,1] ? Possessive::APOSTROPHE_CHAR : Possessive::APOSTROPHE_CHAR+"s")
  end
end

module Possessive
  APOSTROPHE_CHAR = '’'
end
