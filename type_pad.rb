#class that allows a user to input a string and return a number from a phone typepad

class TypePad
  def initialize(string)
    raise "error, needs to be a non empty string" unless !string.empty?
    @string = string.upcase
    @keypad = (2..9).to_a
    @alph_array = set_alph_array
    @hash_map = {}
  end

  def search_text
    #takes array of alphabet elements that corresponds to phone typad
    #and creates a hash map with the number that corresponds
    @alph_array.each do |elm|
      key = @keypad.first
      map_string_num(key, elm)
      @keypad.delete(key)
    end
    print_results
  end

  def print_results
    output = @string.chars.map {|str| @hash_map[str] }.join (" ")
    puts "#{@string} prints to #{output}"
  end

  private

  def map_string_num(key, elm)
    elm.each_with_index do |x, i|
      if i > 0
        keys = (0..i).to_a.map {|y| key }.join("")
        @hash_map[x] = keys
      else
        @hash_map[x] = key.to_s
      end
    end
  end

  def set_alph_array
    #creates an array of numbers that is in the same format as a phones typad
    map_alph(("A".."O"), 3) + map_alph(("P".."S"), 4) + map_alph(("T".."V"), 3) + map_alph(("W".."Z"), 4)
  end

  def map_alph(array, num)
    array.to_a.each_slice(num).map { |el| el }
  end
end

test = TypePad.new("mike")
test.search_text
