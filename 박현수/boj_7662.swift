let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    var isDeleted = Array(repeating: false, count: k)

    var maxHeap = Heap() { $0.0 > $1.0 }
    var minHeap = Heap() { $0.0 < $1.0 }

    for i in 0..<k {
        let input = readLine()!.split(separator: " ")
        let op = input[0]
        let n = Int(input[1])!

        if op == "I" {
            minHeap.push((n, i))
            maxHeap.push((n, i))
        }
        else if n == 1 {
            while let top = maxHeap.peek, isDeleted[top.1] { maxHeap.pop() }
            if let max = maxHeap.pop() { isDeleted[max.1] = true }
        }
        else {
            while let top = minHeap.peek, isDeleted[top.1] { minHeap.pop() }
            if let min = minHeap.pop() { isDeleted[min.1] = true }
        }
    }

    while let top = maxHeap.peek, isDeleted[top.1] { maxHeap.pop() }
    while let top = minHeap.peek, isDeleted[top.1] { minHeap.pop() }

    if maxHeap.isEmpty { print("EMPTY") }
    else { print(maxHeap.peek!.0, minHeap.peek!.0) }
}


struct Heap {
    private var elements: [(Int, Int)]
    private var priority: ((Int, Int), (Int, Int)) -> Bool

    var isEmpty: Bool { elements.isEmpty }

    var peek: (Int, Int)? { elements.first }

    var count: Int { elements.count }

    init(elements: [(Int, Int)] = [], priority: @escaping ((Int, Int), (Int, Int)) -> Bool) {
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

    mutating func push(_ element: (Int, Int)) {
        elements.append(element)
        siftUp(count - 1)
    }

    @discardableResult
    mutating func pop() -> (Int, Int)? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !isEmpty { siftDown(0) }
        return popped
    }

    private mutating func siftUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        while childIndex > 0 {
            let parentIndex = (childIndex - 1) / 2
            let parent = elements[parentIndex]
            if priority(parent, child) { break }
            elements[childIndex] = parent
            childIndex = parentIndex
        }
        elements[childIndex] = child
    }

    private mutating func siftDown(_ index: Int) {
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
