class Stack:
    def __init__(self):
        self.items = []

    def _validate_has_items(self):
        if len(self.items) == 0:
            raise Exception("Queue is empty")

    # Amortized O(1) because list type is implemented with an array
    def push(self, items):
        self.items.append(items)

    # O(1)
    def pop(self):
        self._validate_has_items()
        return self.items.pop()

    # O(1)
    def peek(self):
        self._validate_has_items()
        return self.items[0]

    # O(1)
    def is_empty(self):
        return len(self.items) <= 0
