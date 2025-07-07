let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let m = input[1]

    let docsArray = readLine()!.split(separator: " ").compactMap { Int($0) }
    var docsQueue = Queue()
    var priorityQueue = Heap(elements: docsArray, priority: >)

    var result = 0

    for (idx, doc) in docsArray.enumerated() {
        docsQueue.enqueue((idx, doc))
    }

    while !docsQueue.isEmpty {
        let popped = docsQueue.dequeue()!
        let (idx, doc) = (popped.0, popped.1)

        if doc == priorityQueue.peek {
            result += 1
            priorityQueue.pop()
            if idx == m { print(result); break }
        }
        else { docsQueue.enqueue(popped) }
    }
}

struct Queue {
    private var _inputStack = [(Int, Int)]()
    private var _outputStack = [(Int, Int)]()

    var isEmpty: Bool { _inputStack.isEmpty && _outputStack.isEmpty }
    var count: Int { _inputStack.count + _outputStack.count }

    mutating func enqueue(_ element: (Int, Int)) {
        _inputStack.append(element)
    }

    mutating func dequeue() -> (Int, Int)? {
        if _outputStack.isEmpty {
            _outputStack = _inputStack.reversed()
            _inputStack = []
        }
        return _outputStack.popLast()
    }
}

struct Heap {
    private var elements: [Int]
    let priority: (Int, Int) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    var peek: Int? { elements.first }

    init(elements: [Int] = [], priority: @escaping (Int, Int) -> Bool) {
        self.elements = elements
        self.priority = priority

        heapify()
    }

    mutating func heapify() {
        guard !isEmpty else { return }
        for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    mutating func push(_ element: Int) {
        elements.append(element)
        siftUp(elements.count - 1)
    }

    @discardableResult
    mutating func pop() -> Int? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    mutating private func siftUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]

        while childIndex > 0 {
            let parentIndex = (childIndex - 1) / 2
            let parent = elements[parentIndex]

            if priority(child, parent) { break }

            elements[childIndex] = parent
            childIndex = parentIndex
        }
        elements[childIndex] = child
    }

    mutating private func siftDown(_ index: Int) {
        var parentIndex = index

        while true {
            let leftIndex = parentIndex * 2 + 1
            let rightIndex = parentIndex * 2 + 2
            var candidateIndex = parentIndex

            if leftIndex < count, priority(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count, priority(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            if candidateIndex == parentIndex { break }

            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
