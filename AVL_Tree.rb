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
    
    uusi.height = 0
    self.size += 1
    parent = uusi.parent
    while parent != nil
      if parent.balance > 1
        granpa = parent.parent
        
        if parent.left.balance > 0
          sub_tree = self.rightRotate parent
        else
          sub_tree = self.leftRightRotate parent
        end
        
        if granpa == nil
          @root = sub_tree
        elsif granpa.left == parent
          granpa.left = sub_tree
        else
          granpa.right = sub_tree
        end
        
        if granpa != nil
          granpa.height = granpa.calculate_height
        end
      elsif parent.balance < -1
        granpa = parent.parent
        
        if parent.right.balance < 0
          sub_tree = self.leftRotate parent
        else
          sub_tree = self.rightLeftRotate parent
        end
        
        if granpa == nil
          @root = sub_tree
        elsif granpa.left == parent
          granpa.left = sub_tree
        else
          granpa.right = sub_tree
        end
        
        if granpa != nil
          granpa.height = granpa.calculate_height
        end
      end
      
      parent.height = parent.calculate_height
      parent = parent.parent
    end
    
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
  alias_method :find, :search
  
  protected
  
  def rightRotate(x)
    y = x.left
    y.parent = x.parent
    x.parent = y
    x.left = y.right
    y.right = x
    
    if x.left != nil
      x.left.parent = x
    end
    
    x.height = x.calculate_height
    y.height = y.calculate_height
    y
  end
  
  def leftRotate(x)
    y = x.right
    y.parent = x.parent
    x.parent = y
    x.right = y.left
    y.left = x
    
    if x.right != nil
      x.right.parent = x
    end
    
    x.height = x.calculate_height
    y.height = y.calculate_height
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
  
  def calculate_height
    left = self.left ? self.left.height : -1
    right = self.right ? self.right.height : -1
    [left, right].max + 1
  end
  
  def balance
    left = self.left ? self.left.height : -1
    right = self.right ? self.right.height : -1
    left - right
  end
  
  def to_s
    "Key: #{@key}, height: #{@height}"
  end
end