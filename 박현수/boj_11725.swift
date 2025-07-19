import Foundation

let n = Int(readLine()!)!

var parent = [Int](repeating: -1, count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var tree = [Int: [Int]]()

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (u, v) = (input[0], input[1])

    tree[u, default: []].append(v)
    tree[v, default: []].append(u)
}

var queue = Queue()
queue.enqueue(1)
visited[1] = true

while !queue.isEmpty {
    let current = queue.dequeue()!

    for child in tree[current, default: []] {
        guard !visited[child] else { continue }
        visited[child] = true
        parent[child] = current
        queue.enqueue(child)
    }
}

for i in 2...n { print(parent[i]) }


struct Queue {
    private var inputStack = [Int]()
    private var outputStack = [Int]()

    var isEmpty: Bool { inputStack.isEmpty && outputStack.isEmpty }
    var count: Int { inputStack.count + outputStack.count }

    mutating func enqueue(_ element: Int) {
        inputStack.append(element)
    }

    @discardableResult
    mutating func dequeue() -> Int? {
        if outputStack.isEmpty {
            outputStack = inputStack.reversed()
            inputStack = []
        }
        return outputStack.popLast()
    }
}

