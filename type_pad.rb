#class that allows a user to input a string and return a number from a phone typepad
require 'pry'

class TypePad

  def self.search_text(string)
    new(string).print_results
  end

  def initialize(string)
    raise "error, needs to be a non empty string" unless !string.empty?
    @string = string.upcase
    @keypad = (2..9).to_a
    @hash_map = {}
  end

  def print_results
    #takes array of alphabet elements that corresponds to phone typad
    #and creates a hash map with the number that corresponds
    alph_array.each do |elm|
      key = @keypad.first
      map_string_num(key, elm)
      @keypad.delete(key)
    end
    process
  end

  def process
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

  def alph_array
    #creates an array of numbers that is in the same format as a phones typad
    map_alph(("A".."O"), 3) + map_alph(("P".."S"), 4) + map_alph(("T".."V"), 3) + map_alph(("W".."Z"), 4)
  end

  def map_alph(array, num)
    array.to_a.each_slice(num).map { |el| el }
  end
end

TypePad.search_text("BATMAN")

