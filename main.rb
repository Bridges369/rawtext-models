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
