#!/usr/local/bin//ruby -w
#
# AVL-puu, eli tasapainotettu binäärihakupuu, johon voidaan tallettaa yksinkertaisia avaimia, kuten kokonaislukuja.

class AVLTree
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end
  
  def height(x = self.root)
    if x == nil
      -1
    else
      x.height
    end
  end
  
  def min(x = self.root)
    while x.left != nil
      x = x.left
    end
    x
  end
  
  def max(x = self.root)
    while x.right != nil
      x = x.right
    end
    x
  end
  
  def succ(x = self.root)
    if x.right != nil
      return min(x.right)
    end
    parent = x.parent
    while parent != nil and x == parent.right
      x = parent
      parent = x.parent
    end
    x
  end
  
  def add(key)
    uusi = TreeItem.new(key)
    if @root == nil
      @root = uusi
      @root.height = 0
      return
    else
      current = @root
      parent = nil
      while current != nil
        parent = current
        if key < current.key
          current = current.left
        else
          current = current.right
        end
      end
      uusi.parent = parent
    end
    if uusi.key < parent.key
      parent.left = uusi
    else
      parent.right = uusi
    end
    uusi
  end
  
  def search(key)
  end
end

class TreeItem
  attr_accessor :key, :left, :right, :parent, :height
  def initialize(key, left = nil, right = nil, parent = nil, height = nil)
    @key = key
    @left = left
    @right = right
    @parent = parent
    @height = height
  end
  
  def to_s
    "Key: #{@key}, parent: #{@parent}, left child: #{@left}, right child: #{@right}, height: #{@height}"
  end
end