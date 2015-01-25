class Promotional

  def rules
    @rules ||= []
  end

  def rules_count
    rules.count
  end

  def add(rule)
    rules << rule
  end

  def remove(rule)
    rules.delete(rule)
  end

end
