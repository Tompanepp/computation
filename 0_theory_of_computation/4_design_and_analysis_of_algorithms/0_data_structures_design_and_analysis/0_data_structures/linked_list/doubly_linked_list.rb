class Node
    attr_accessor :next_node, :previous_node, :data
    
    def initialize(data)
        @data = data
    end
end

'''
    Since DoublyLinkedList knows first and last node
    insertion at end is O(1) 
    removal from beginning is O(1)

    perfect for a queue
    vs normal linked list O(1) removal from beginning, 𝑂(𝑁) insertion at the end
    vs array 𝑂(𝑁) removel from beginning, O(1) insetion at the end
'''
class DoublyLinkedList
    attr_accessor :first_node, :last_node
    def initialize(first_node = nil, last_node = nil)
        @first_node = first_node
        @last_node = last_node
    end
    def insert_at_end(value)
        new_node = Node.new(value)
        if !first_node
            @first_node = new_node
            @last_node = new_node
        else
            @last_node.next_node = new_node
            new_node.previous_node = @last_node
            @last_node = new_node
        end
    end

    def remove_front_front
        _first_node = @first_node
        @first_node = @first_node.previous_node
        return _first_node    
    end

    def print
        _print(@first_node)
    end
    private def _print(current_node)
        if(!current_node)
            return 
        end
        puts current_node.data
        _print(current_node.next_node)
    end
end

class Queue
    attr_accessor :data

    def initialize
       @data = DoublyLinkedList.new() 
    end
    
    def enqueue(value)
        return @data.insert_at_end(value)
    end

    def dequeue
        removed_node = @data.remove_front_front
        return removed_node.data
    end

    def tail
        return @data.last_node.data
    end

    def print
        @data.print()
    end
end

#Testing

puts "uasge of Doubly Linked List direct"
node1 = Node.new(1)
#"linking" node1 to node2
node2 = Node.new(2)
node1.next_node = node2

node3 = Node.new(3)
node2.next_node = node3

node4 = Node.new(4)
node3.next_node = node4

linkedlist = DoublyLinkedList.new(node1, node4)
linkedlist.print()

puts "inserting at the end"
linkedlist.insert_at_end(5)
linkedlist.print()

puts "removing from front"
front_node = linkedlist.remove_front_front()
puts "front node data #{front_node}"


puts "Doubly linked list as perfect basis for queue"

shopping_queue = Queue.new()
puts "shoopers comes along"
shopping_queue.enqueue("Sue")
shopping_queue.enqueue("Thapelo")
shopping_queue.enqueue("Mashoto")

puts "printing shoopers"
shopping_queue.print()

puts "chasier gets to work"
shopper = shopping_queue.dequeue()
puts "first shopper assisted #{shopper}" 

puts "unlucky last shopper :(, #{shopping_queue.tail}"