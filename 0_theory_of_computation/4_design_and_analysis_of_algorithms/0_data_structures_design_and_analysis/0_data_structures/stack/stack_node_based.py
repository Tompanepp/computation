class Node:
    data = None
    next = None

    def __init__(self, data):
        self.data = data


class Stack:
    top = None

    def _validate_has_items(self):
        if self.top is None:
            raise Exception("Stack is empty")

    # O(1)
    def push(self, item):
        node = Node(item)
        node.next = self.top
        self.top = node

    # O(1)
    def pop(self):
        self._validate_has_items()
        item = self.top.data
        self.top = self.top.next
        return item

    # O(1)
    def peek(self):
        self._validate_has_items()
        return self.top.data

    # O(1)
    def is_empty(self):
        return self.top is None
