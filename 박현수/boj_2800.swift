let expr = readLine()!.enumerated()

var stack = [(Character, Int)]()
var pairs = [(Int, Int)]()
var toRemove = [Set<Int>]()
var results = Set<String>()

for (idx, element) in expr {
    switch element {
    case "(":
        stack.append((element, idx))
    case ")":
        pairs.append((stack.last!.1, idx))
        _ = stack.popLast()
    default: continue
    }
}

for i in 1...pairs.count {
    var set = Set<Int>()
    dfs(&set, 0, i)
}

for i in 0..<toRemove.count {
    var str = ""
    for (idx, elem) in expr {
        if toRemove[i].contains(idx) { continue }
        str.append(elem)
    }
    results.insert(str)
}

print(Array(results).sorted().joined(separator: "\n"))


func dfs(_ set: inout Set<Int>, _ start: Int, _ count: Int) {
    if set.count == count {
        var toRemoveSet = Set<Int>()
        set.forEach {
            toRemoveSet.insert(pairs[$0].0)
            toRemoveSet.insert(pairs[$0].1)
        }
        toRemove.append(toRemoveSet)
        return
    }

    for i in start..<pairs.count {
        set.insert(i)
        dfs(&set, i + 1, count)
        set.remove(i)
    }
}
