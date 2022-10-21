class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parentnode)
        return if self.parent == parentnode

        unless self.parent == nil
            self.parent.children.delete(self)
        end

        @parent = parentnode

        unless @parent == nil    
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "This is not a child of this node" if child_node.parent != self
        child_node.parent = nil
        self.children.delete(child_node)
    end

    def dfs(target)
        return nil if self == nil
        return self if self.value == target

        self.children.each do |child|
            search_res = child.dfs(target)
            return search_res unless search_res == nil
        end
        nil
    end

    def bfs(target)
        array = [self]
        
        until array.empty?
            if array.first.value == target
                return array.first
            else
                array += array.shift.children
            end
        end
        nil
    end

    def inspect
        {"parent" => @parent == nil ? nil : @parent.value, "children"=> @children.map {|child| child == nil ? nil : child.value}, "value" => @value}
    end
    # 
    # 
    #a b c
    # b the child of a

    # a.add_child(b)


end

# nodeG.parent = nodeB






# node.parent = (parentnode)


#        a
#       / \
#      b   c
#     / \ / \
#     d e f g 


#        a
#       / \
#      b   c
#    / / \  \ 
#    g d e   f


# OG
# g.parent = c
# c.children = [c,f]

# switch to b
# c.children = [g,f]
# b.children = [g,d,e]
