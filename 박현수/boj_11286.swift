let n = Int(readLine()!)!

var heap = Heap() {
    if abs($0) == abs($1) { return $0 < $1 }
    else { return abs($0) < abs($1) }
}

var output = ""

for _ in 0..<n {
    let x = Int(readLine()!)!

    if x == 0 {
        if let popped = heap.pop() { output += "\(popped)\n" }
        else { output += "0\n" }
    } else {
        heap.push(x)
    }
}

print(output, terminator: "")

struct Heap {
    private var elements: [Int]
    private var priority: (Int, Int) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    init(
        elements: [Int] = [],
        priority: @escaping (Int, Int) -> Bool
    ) {
        self.elements = elements
        self.priority = priority
        heapify()
    }

    mutating func heapify() {
        guard !elements.isEmpty else { return }

        for i in stride(from: count / 2 - 1, through: 0, by: -1) {
            siftDown(i)
        }
    }

    mutating func push(_ element: Int) {
        elements.append(element)
        siftUp(count - 1)
    }

    @discardableResult mutating func pop() -> Int? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        let popped = elements.removeLast()
        if !elements.isEmpty { siftDown(0) }
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
            let leftIndex = 2 * parentIndex + 1
            let rightIndex = 2 * parentIndex + 2
            var candidateIndex = parentIndex

            if leftIndex < count && priority(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            if rightIndex < count && priority(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            if candidateIndex == parentIndex { break }
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}
