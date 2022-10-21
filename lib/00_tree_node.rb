class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parentnode)
        return if self.parent == parentnode

            #C's children array - remove self from
        unless self.parent == nil
            self.parent.children.delete(self)
        end
        @parent = parentnode

        #nodeB is self
        #nodeA is parentnode

        unless @parent == nil    
            @parent.children << self
        end
    end
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
