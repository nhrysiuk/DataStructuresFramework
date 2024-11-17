# DataStructuresFramework

The framework is designed to provide access to implementations of key data structures with a simple, intuitive API.

## How to install:

### [Swift Package Manager](https://github.com/apple/swift-package-manager)
Choose File -> Add Package Dependencies. Enter     `https://github.com/nhrysiuk/DataStructuresFramework.git` to the search field and choose the right version.
Click `Add Package` and...well done!

You can also add the package by pasting the following code to `Package.swift`: 
```
dependencies: [
 .package(url: "https://github.com/nhrysiuk/DataStructuresFramework.git", branch: "main")
]
```
### [CocoaPods](https://cocoapods.org)

* Add the following code to your Podfile: `pod 'DataStructuresFramework', '~> 0.0.1'` (be sure to replace the version to the latest (You can find it  [here](https://cocoapods.org/pods/HrysiukDataStructuresFramework)).

* Run `pod install` in your terminal.

And that's all, congratulations!
  
## Available data structures:
### Stack

A Stack is an abstraction for a collection of elements that follows the "Last In, First Out" (LIFO) principle.

#### Usage:
* `storage` — Returns all the elements stored in stack.
* `push(element)` — Adds an element to the top of the stack.
* `pop()` — Removes and returns the top element from the stack.
* `isEmpty()` — Checks whether the stack is empty.
* `description` — Returns a description of a stack.

#### Example:
```
 var stack = Stack<Int>()
 stack.push(1)
 stack.push(2)
 stack.pop()
 print(stack.description)
```

### Queue

A Queue is a data structure that follows the "First In, First Out" (FIFO) principle.

#### Usage:
* `array` — Returns all the elements stored in queue.
* `enqueue(element)` — Adds an element to the back of the queue.
* `dequeue()` — Removes and returns the element from the front of the queue.
* `peek()` — Returns the front element without removing it.
* `isEmpty()` — Checks whether the queue is empty.

#### Example:
```
var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.dequeue()
let isEmpty = queue.isEmpty
```

### Priority Queue

A Priority Queue is a variant of the queue where each element has a priority, and elements with higher priority are dequeued first, even if they were added later.

#### Usage:
* `elements` — Returns all the elements stored in queue.
* `enqueue(element, priority)` — Adds an element with a specified priority.
* `dequeue()` — Removes and returns the element with the highest priority.
* `peek()` — Returns the element with the highest priority without removing it.
* `isEmpty()` — Checks whether the priority queue is empty.

#### Example:
```
var queue = PriorityQueue<String>()
queue.enqueue("A", withPriority: 5)
queue.enqueue("B", withPriority: 2)
queue.enqueue("C", withPriority: 8)
let element = queue.peek()
queue.dequeue()

```

### Vector

A Vector is a data structure representing a dynamic array that allow storing elements and dynamically resizing as elements are added or removed.

### Usage:

* `components` — Returns all the components of the vector as an array of Double values.

* `dimension` — Returns the dimension (number of components) of the vector.

* `subscript(index:)` — Accesses or modifies the component at the specified index.

* `+ (lhs, rhs)` — Adds two vectors of the same dimension and returns the resulting vector.

* `- (lhs, rhs)` — Subtracts one vector from another of the same dimension and returns the resulting vector.

* `* (lhs, scalar)` — Multiplies a vector by a scalar value and returns the resulting scaled vector.
* `* (lhs, rhs)` — Computes the dot product of two vectors of the same dimension and returns the result.

* `magnitude()` — Calculates and returns the magnitude (length) of the vector.

* `normalize()` — Returns the normalized unit vector (magnitude of 1) in the same direction as the original vector.
*  `description` — A textual description of the vector, represented as a string with components.

#### Example:
```
let vector1 = Vector(components: [1, 2, 3])
let vector2 = Vector(components: [4, 5, 6])
let result = vector1 + vector2
let normalizedVector = vector1.normalize()
```

### Matrix

A Matrix is a two-dimensional array of elements arranged in rows and columns. 

#### Usage:
* `data` — Returns the 2D array representing the matrix data.
*  `rows` — Returns the number of rows in the matrix.
* `columns` — Returns the number of columns in the matrix.
* `subscript(row:column:)` — Accesses or modifies the element at the specified row and column index.
*  `transpose()` — 
* `+ (lhs, rhs)` — Adds two matrices element-wise and returns the resulting matrix.
* `- (lhs, rhs)` — Subtracts two matrices element-wise and returns the resulting matrix. 
* `== (lhs, rhs)` — Compares two matrices for equality and returns true if they are equal.
* `description` — A textual representation of the matrix, represented as a string with each row of the matrix displayed on a new line.

#### Example:
```
let matrix = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
let matrix2 = Matrix(fromArray: [[1.0, 2.0, 0.0], [3.0, 5.0, 10.0]])
let matrix3 = matrix - matrix2
```

### Linked List

A Linked List is a linear data structure where each element (node) points to the next one, allowing for dynamic memory allocation and efficient insertions/deletions at arbitrary positions.

#### Usage:
* `head` — The first node in the linked list.
* `tail` — The last node in the linked list.
* `isEmpty` — Checks if the linked list is empty.
* `push(value)` — Adds a value to the front of the list.
* `append(value)` — Adds a value to the end of the list.
* `node(at:)` — Returns the node at a specified index.
* `insert(value, after:)` — Inserts a value after a specific node.
* `pop()` — Removes and returns the value at the front of the list.
* `removeLast()` — Removes and returns the value at the end of the list.
* `remove(after:)` — Removes and returns the value of the node after a specific node.
* `description` — A string representation of the list.

#### Example:
```
var list = LinkedList<Int>()
list.push(1)
list.push(2)
list.push(3)

guard let secondNode = list.head?.next else { return }

list.insert(4, after: secondNode)
```

### Graph

A Graph is a non-linear data structure consisting of nodes (vertices) connected by edges, that can be directed or undirected.

#### Usage:
* `addVertex(_:)` — Adds a vertex to the graph (if it doesn't already exist).
* `addEdge(from:to:)` — Adds an edge between two vertices. For undirected graphs, it adds edges in both directions.
* `neighbors(of:)` — Returns the neighbors of a given vertex.
* `bfs(from:)` — Performs Breadth-First Search starting from a given vertex. Returns the vertices in the order visited.
* `dfs(from:)` — Performs Depth-First Search starting from a given vertex. Returns the vertices in the order visited.
* `description` — A string representation of the graph, showing each vertex and its neighbors.


#### Example:
```
let graph = Graph<Int>()
graph.addVertex(0)
graph.addVertex(1)
graph.addEdge(from: 0, to: 1)
graph.addEdge(from: 0, to: 2)
graph.addEdge(from: 0, to: 3)
let neighbors = graph.neighbors(of: 0)
```

### Binary Tree

A Binary Tree is a hierarchical structure where each node has at most two children.

#### Usage:
* `traversePostOrder(_:) `— Traverses the tree in post-order (left, right, root) and applies the closure to each node's value.
* `traverseInOrder(_:)` — Traverses the tree in in-order (left, root, right) and applies the closure to each node's value.
* `traversePreOrder(_:)` — Traverses the tree in pre-order (root, left, right) and applies the closure to each node's value.
* `description` — Returns a closure that takes a TraversalOrder (preOrder, inOrder, or postOrder) and returns a string representation of the tree's nodes in that order.

#### Example:
```
let node = BinaryNode(0)
let node2 = BinaryNode(1)
let node3 = BinaryNode(2)
node.leftChild = node2
node.rightChild = node3
```
