class RandomGenerator
  def self.access_key
    /R\d{4}-\w\d{2}\w/.gen
  end
end