module RandomStringHelper
  def generate_random_string(length)
    characters = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
    (0...length).map { characters[rand(characters.length)] }.join
  end
  def generate_random_string_excluding_katakana(length)
    characters = [('a'..'z'), ('A'..'Z'), ('0'..'9'), ('ぁ'..'ん'), ('一'..'龥')].map(&:to_a).flatten
    (0...length).map { characters[rand(characters.length)] }.join
  end
end