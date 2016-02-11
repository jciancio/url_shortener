class UrlGenerator
  def self.generate
    (0...5).map { (65 + rand(26)).chr }.join.downcase
  end
end
