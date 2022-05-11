module Wordcheat
  class Cheater
    def initialize
      @words_list_path = "./words.txt"
      @pattern = nil
      @only = nil
      @must = nil
      @must_not = nil
      @length = nil
    end

    def words
      words = load_words(@words_list_path)
      words = length(@length, words) if @length
      words = only(@only, words) if @only
      words = must(@must, words) if @must
      words = must_not(@must_not, words) if @must_not
      words = at(@pattern, words) if @pattern
      words
    end

    def words_list_path= path
      @words_list_path = path
    end
    
    def load_words word_list_path
      contents = File.read(word_list_path)
      contents.lines.map(&:strip).map(&:downcase)
    end

    def pattern= pattern
      @pattern = pattern.downcase
    end

    def at pattern, words
      arr = pattern.chars.map do |ch|
        if ('A'..'Z').include?(ch) || ('a'..'z').include?(ch)
          ch.downcase
        else
          nil
        end
      end

      words.select do |word|
        if word.length != arr.length
          false
        else
          pass = true
          word.chars.each_with_index do |ch, idx|
            pass = false if arr[idx] && arr[idx] != ch
          end
          pass
        end
      end
    end

    def only= chars
      @only = chars.downcase
    end

    def only chars, words
      arr = chars.chars
      words.select do |word|
        if word.chars.any? {|ch| !(arr.include?(ch)) }
          false
        else
          true
        end
      end
    end

    def must= chars
      @must = chars.downcase
    end

    def must chars, words
      arr = chars.chars
      words.select do |word|
        if arr.all? {|ch| word.include?(ch) }
          true
        else
          false
        end
      end
    end

    def must_not= chars
      @must_not = chars.downcase
    end

    def must_not chars, words
      arr = chars.chars
      words.select do |word|
        if arr.any? {|ch| word.include?(ch) }
          false
        else
          true
        end
      end
    end

    def length= len
      @length = Integer(len)
    end

    def length len, words
      words.select {|word| word.length == len }
    end
  end
end
