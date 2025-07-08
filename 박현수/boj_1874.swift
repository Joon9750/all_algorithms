let n = Int(readLine()!)!

var stack = [Int]()
var arr = [Int]()
for _ in 0..<n { arr.append(Int(readLine()!)!) }

var current = 1
var output = ""

for d in arr {
    while current <= d {
        stack.append(current)
        current += 1
        output.append("+\n")
    }
    if stack.last == d {
        _ = stack.popLast()
        output.append("-\n")
    } else {
        output = "NO\n"
        break
    }
}

print(output, terminator: "")
