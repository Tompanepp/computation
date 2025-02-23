class Node:
    data = None
    next = None

    def __init__(self, data):
        self.data = data


class Queue:
    first = None
    last = None

    # O(1)
    def enqueue(self, item):
        node = Node(item)
        if self.first is None:
            self.first = node
            self.last = self.first
        else:
            self.last.next = node
            self.last = node

    # O(1)
    def dequeue(self):
        if self.first is None:
            raise Exception("Queue is empty")
        else:
            item = self.first.data
            self.first = self.first.next
            if self.first is None:
                self.last = None
            return item

    # O(1)
    def peek(self):
        if self.first is None:
            raise Exception("Queue is empty")
        else:
            return self.first.data

    # O(1)
    def is_empty(self):
        return self.first is None

    # 𝑂(𝑁)
    def __str__(self):
        current = self.first
        queue = ""
        if self.first is None:
            return "queue is empty"
        else:
            while current.next is not None:
                queue += str(current.data) + "->"
                current = current.next
            queue += str(current.data)
        return queue


def main():
    print("Can create queue")
    teller_service_queue = Queue()
    print(teller_service_queue)

    print("Can enqueue to queue")
    teller_service_queue.enqueue(1)
    print(teller_service_queue)

    print("Can check what is next is queue")
    print(teller_service_queue.peek())

    print("Can dequeue next item in queue")
    print(teller_service_queue.dequeue())
    print(teller_service_queue)

    print("Can check if it is empty")
    print(teller_service_queue.is_empty())

    print("Can enqueue more")
    teller_service_queue.enqueue(2)
    teller_service_queue.enqueue(3)
    print(teller_service_queue)


if __name__ == "__main__":
    main()
