module Replace
  
  def self.spaces_in_string(string)
    raise NotEnoughSpacesError if self.not_enough_space_in string 
    string = string.strip.split
    string.join("%20")
  end
  
  def self.get_number_of_spaces_in(string)
    number_of_words = string.split.size
    number_of_words > 1 ? number_of_words - 1 : number_of_words
  end
  
  def self.not_enough_space_in(string)
    string.nil? || string.length < 3 || (string.length < self.length_with_no_spaces(string) + (self.get_number_of_spaces_in(string)) * 3)
  end
  
  def self.length_with_no_spaces(string)
    string.split.collect { |s| s.length }.inject(0,:+)
  end
  
end

class NotEnoughSpacesError < StandardError; end