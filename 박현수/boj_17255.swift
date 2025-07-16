let target = Array(readLine()!)
let count = target.count
var results = Set<[String]>()

for i in 0..<count { dfs(left: i, right: i, history: [String(target[i...i])]) }
print(results.count)

func dfs(left: Int, right: Int, history: [String]) {
    guard left >= 0, right < count else { return }
    if left == 0, right == count - 1 {
        results.insert(history)
        return
    }

    if left > 0 {
        var newHistory = history
        newHistory.append(String(target[left - 1...right]))
        dfs(left: left - 1, right: right, history: newHistory)
    }

    if right < count - 1 {
        var newHistory = history
        newHistory.append(String(target[left...right + 1]))
        dfs(left: left, right: right + 1, history: newHistory)
    }
}
