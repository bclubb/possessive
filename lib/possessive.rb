# encoding: utf-8

String.class_eval do
  def possessive
    self + ('s' == self[-1,1] ? Possessive::APOSTROPHE_CHAR : Possessive::APOSTROPHE_CHAR+"s")
  end
end

module Possessive
  APOSTROPHE_CHAR = '’'
end
