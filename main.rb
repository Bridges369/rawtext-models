=begin 
# COLORS
0 : Black
1 : DarkBlue
2 : DarkGreen
3 : DarkCyan
4 : DarkRed
5 : DarkMagenta
6 : DarkOrange
7 : LightGray
8 : Gray
9 : Blue
a : Green
b : Cyan
c : Red
d : Magenta
e : Yellow
f : White
g : Gold
k : Obfuscated
l : Bold
o : Italic
r : Remove

# JSON COMPONENT
{"minecraft:can_place_on":{"blocks":[]}}
{"minecraft:can_destroy":{"blocks":[]}}
{"minecraft:item_lock":{"mode":"lock_in_inventory"}}
{"minecraft:item_lock":{"mode":"lock_in_slot"}}
{"minecraft:keep_on_death":{}}
=end

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
      tmp = text
      # Replace tmp according to the each replacements hashes
      hash[1].each { |k, v| tmp.gsub!(k, v) }
      collect[i] = tmp
    end
    return collect
  end
end

component = <<-JSON
§7{
  §8"minecraft:§fkeep_on_death§8"§7: {}
§7}
JSON

title = <<-TEXT
§8------------
§fkeep_on_death
§8-----------
TEXT

pa = Parse.new(
  book: {"\n" => "n", "\s\s" => "ss"}
)
p pa.parse(component)

__END__
IO.write("clip.txt", <<~EOF
tellraw @a {"rawtext":[{"text":"§8--------------------------------§r\\n#{component
  .chomp
  .gsub(/\n/, '\\n')
  .gsub(/"/, '\\"')
}\\n§8--------------------------------"}]}

#{component
  .chomp
  .gsub(/\n/, '')
  .gsub(/\s/, '')
}

{"rawtext":[{"text":"#{title
  .chomp
  .gsub(/\n/, '\\n')
}"}]}
EOF
)
