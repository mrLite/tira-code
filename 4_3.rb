#!/usr/local/bin//ruby -w
#
# Yhteen suuntaan linkitetty lista johon voidaan tallettaa yksinkertaisia avaimia, kuten kokonaislukuja.
# Lista pitää alkiot järjestyksessä pienimmästä suurimpaan.

class LinkedList
  attr_accessor :head, :size
  
  def initialize(head = nil, size = 0)
    @head = head
    @size = size
  end
  
  def empty?
    @head == nil
  end
  
  def add(uusi)
    new_item = ListItem.new(uusi)
    @size += 1
    current = @head
    prev = nil
    while current != nil and new_item.key > current.key
      prev = current
      current = current.next
    end
    new_item.next = current
    if prev == nil
      @head = new_item
    else
      prev.next = new_item
    end
  end
  
  def delete(key)
    current = @head
    prev = nil
    while current != nil and current.key != key
      prev = current
      current = current.next
    end
    if current
      prev == nil ? @head = current.next : prev.next = current.next
    end
    current
  end
  
  def search(key)
    current = @head
    return false if current == nil
    while current.next != nil and key > current.key
      current = current.next
    end
    current.key == key ? current : false
  end
  
  # def list
  #   a = @head
  #   print "Listan alkiot:\n"
  #   while a != nil
  #     print "#{a.key}"
  #     print ", " unless a.next == nil
  #     a = a.next
  #   end
  #   print "\n"
  # end
  
  def list
    self.each { |n| print n.key, " " }
    print "\n"
  end
  
  def each
    item = @head
    while item
      yield item
      item = item.next
    end
  end
end

class ListItem
  attr_accessor :next
  attr_reader :key
  def initialize(key, next_item = nil)
    @key = key
    @next = next_item
  end
  
  def to_s
    "Avain: #{@key}, seuraava arvo: #{@next ? @next.key : 'NULL'}"
  end
end