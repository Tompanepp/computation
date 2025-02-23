class Queue:
    processing_counter = 0

    def __init__(self):
        self.items = []

    def _validate_has_items(self):
        if len(self.items) == 0:
            raise Exception("Queue is empty")

    # Amortized O(1) because list type is implemented with an array
    def enqueue(self, item):
        self.items.append(item)

    # O(1)
    def dequeue(self):
        self._validate_has_items()
        item = self.items[self.processing_counter]
        self.processing_counter += 1
        return item

    # O(1)
    def peek(self):
        self._validate_has_items()
        return self.items[self.processing_counter]

    # O(1)
    def is_empty(self):
        return len(self.items) == 0

    # 𝑂(𝑁)
    def __str__(self):
        return ",".join([str(i) for i in self.items])


def main():
    print("Can create queue")
    teller_service_queue = Queue()
    print(teller_service_queue)

    print("Can enqueue to queue")
    teller_service_queue.enqueue(1)
    print(teller_service_queue)

    print("Can check what is next is queue")
    print(teller_service_queue.peek())

    print("Can remove next item in queue")
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
