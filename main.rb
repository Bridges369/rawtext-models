class Parse
  # obj = Parse.new(
  #   sign: {/\n/ => '', /\s/ => ''},
  #   sign_with_new_lines: {/\n/ => '\\n'}
  # )
  def initialize(**modes)
    @modes = modes
  end

  def parse(text)
    collect = Array.new(@modes.length)

    @modes.each_with_index do |hash, i|
      # The method below of this don't return the string, therefore the gsub! method will be used in a variable tmp
      tmp = text.chomp
      # Replace tmp according to the each replacements hashes
      hash[1].each do |k, v| 
        if (k != :prefix or k == :sufix) and (k == :prefix or k != :sufix)
          tmp.gsub!(k, v)
        end
      end
      collect[i] = (hash[1][:prefix] or "") + tmp + (hash[1][:sufix] or "")
    end
    return collect
  end
end
