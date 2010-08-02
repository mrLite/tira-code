#!/usr/local/bin//ruby -w
#
# AVL-puu, eli tasapainotettu binäärihakupuu, johon voidaan tallettaa yksinkertaisia avaimia, kuten kokonaislukuja.

class AVLTree
  attr_accessor :root, :size
  def initialize(root = nil, size = 0)
    @root = root
    @size = size
  end
  
  def clear
    @root = nil
    @size = 0
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
  
  def pred(x = self.root)
    if x.left != nil
      return max(x.left)
    end
    parent = x.parent
    while parent != nil and x == parent.left
      x = parent
      parent = x.parent
    end
    parent
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
    parent
  end
  
  def rightRotate(x)
    y = x.left
    y.parent = x.parent
    x.parent = y
    x.left = y.right
    y.right = x
    if x == @root
      @root = y
    end
    if x.left != nil
      x.left.parent = x
    end
    y
  end
  
  def leftRotate(x)
    y = x.right
    y.parent = x.parent
    x.parent = y
    x.right = y.left
    y.left = x
    if x == @root
      @root = y
    end
    if x.right != nil
      x.right.parent = x
    end
    y
  end
  
  def rightLeftRotate(x)
    y = x.right
    x.right = rightRotate(y)
    leftRotate(x)
  end
  
  def leftRightRotate(x)
    y = x.left
    x.left = leftRotate(y)
    rightRotate(x)
  end
  
  def add(key)
    uusi = TreeItem.new(key)
    
    if @root == nil
      @root = uusi
      @root.height = 0
      self.size += 1
      return uusi
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
    
    if key < parent.key
      parent.left = uusi
    else
      parent.right = uusi
    end
    
    self.size += 1
    uusi
  end
  alias_method :<<, :add
  
  def search(key, x = self.root)
    while x != nil and x.key != key
      if key < x.key
        x = x.left
      else
        x = x.right
      end
    end
    x
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
  
  def balance
    left_child_height = self.left ? self.left.height : -1
    right_child_height = self.right ? self.right.height : -1
    left_child_height - right_child_height
  end
  
  def to_s
    "Key: #{@key}, parent: #{@parent}, left child: #{@left}, right child: #{@right}, height: #{@height}"
  end
end