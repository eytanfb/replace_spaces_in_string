module Replace
  
  def self.spaces_in_string(string)
    raise NotEnoughSpacesError if !string || string.length < 3
    number_of_words = string.split.size
    string.strip
  end
  
  def self.get_number_of_words_in(string)
    string.split.size
  end
  
end

class NotEnoughSpacesError < StandardError; end