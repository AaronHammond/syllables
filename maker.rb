words = []

File.foreach("most-poetical-words.txt") do |li|
 words.push(li.chomp())
end

File.open("dict.js", "w+") do |fo|
 fo.print "["
 
 File.foreach("syllabification.txt") do |li|
  str = li[/[a-z]+/]
  if(words.include?(str)) then
   words.delete(str)
   num = (li.count("-"))+1 
   fo.print("{word: \"")
   fo.print(str)
   fo.print("\", ")
   fo.print("syllables: ")
   fo.print num.to_s
   fo.print ("},")
   fo.puts
  end
 end
 fo.print  "]"

end
