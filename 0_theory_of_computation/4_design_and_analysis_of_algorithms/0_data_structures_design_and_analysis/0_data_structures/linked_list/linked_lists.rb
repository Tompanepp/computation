class Node
    attr_accessor :data, :next_node
    def initialize(data)
        @data = data
    end
end

class LinkedList
    attr_accessor :first_node
    def initialize(first_node)
        @first_node = first_node
    end

    def read(index)
        currrent_node = @first_node
        currrent_index = 0
        while(currrent_index <= index)
            if(currrent_index == index)
                return currrent_node.data
            end
            currrent_index = currrent_index + 1 
            currrent_node = currrent_node.next_node
        end
        return nil
    end
    
    def find(value)
        currrent_node = @first_node
        currrent_index = 0
        while(currrent_node)
            if(currrent_node.data == value)
                return currrent_index
            end
            currrent_index = currrent_index + 1 
            currrent_node = currrent_node.next_node
        end
        return nil
    end

    def insert(value, index)
        currrent_node = find_node_before_target_index(index)
        new_node = Node.new(value)
        new_node.next_node = currrent_node.next_node
        currrent_node.next_node = new_node
    end

    def delete(index)
        currrent_node = find_node_before_target_index(index)
        currrent_node.next_node = currrent_node.next_node.next_node
    end

    private def find_node_before_target_index(target_index)
        currrent_node = @first_node
        currrent_index = 0
        node_before_target_index = target_index - 1
        while(currrent_index < node_before_target_index)
            currrent_index = currrent_index + 1
            currrent_node = currrent_node.next_node
        end
        return currrent_node
    end

    def print()
        _print(@first_node)
    end

    def _print(node)
        if(!node)
            return
        end
        puts node.data
        _print(node.next_node)
    end
    
end

#usage
node1 = Node.new(1)
#"linking" node1 to node2
node2 = Node.new(2)
node1.next_node = node2

node3 = Node.new(3)
node2.next_node = node3

node4 = Node.new(4)
node3.next_node = node4

#associate root node of the actual linked list to an interface to it.
linkedList = LinkedList.new(node1)
#puts linkedList.read(3)
#puts "index of node with specified value #{linkedList.find(3)}"

puts "inserting 5 into index 3"
linkedList.insert(5, 3)
linkedList.print()
puts "deleting the 5 at index 3"
linkedList.delete(3)
linkedList.print()