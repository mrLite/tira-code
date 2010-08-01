#!/usr/local/bin//ruby -w
#
# Testiohjelma linkitetylle listalle.

require '4_3.rb'

lista = LinkedList.new
 
puts "Lisätään listaan 1 alkiot 11, 22, 32, 45, 55, 67, 76, 88, 99"

[11, 22, 32, 45, 55, 67, 76, 88, 99].each do |n|
  lista.add n
end

puts lista.search 44
puts lista.search 32

lista.list

puts "Poistetaan alkio 67"
lista.delete 67
lista.list

puts "Poistetaan alkio 1234"
lista.delete 1234
lista.list

puts "Poistetaan alkio 11"
lista.delete 11
lista.list

puts "Lisätään alkio 10"
lista.add 10
lista.list

puts "Poistetaan alkio 99"
lista.delete 99
lista.list

puts "Lisätään alkio 95"
lista.add 95
lista.list

lista2 = LinkedList.new
puts "Lisätään listaan 2 alkiot \"a\", \"b\", \"c\", \"d\", \"e\" ja \"f\""
["a", "b", "c", "d", "e", "f"].each { |n| lista2.add n }
puts "Etsitään alkioita \"g\" ja \"a\":"
puts lista2.search "g"
puts lista2.search "a"
puts "Poistetaan alkio \"c\""
lista2.delete "c"
print "Listataan listan 2 alkiot: "
lista2.list