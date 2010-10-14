String.class_eval do
  def possessive
    self + ('s' == self[-1,1] ? "'" : "'s")
  end
end