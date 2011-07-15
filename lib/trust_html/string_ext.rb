class String
  def escape_single_quotes
    self.gsub(/'/, "\\\\'")
  end

  def remove_nonprintable
    self.scan(/[[:print:]]/).join
  end
end

