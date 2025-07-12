let input = readLine()!.split(separator: " ")
let (n, m) = (Int(input[0])!, Int(input[1])!)

var count = 0
var set = Set<String>()

for _ in 0..<n { set.insert(readLine()!) }
for _ in 0..<m { if set.contains(readLine()!) { count += 1 } }

print(count)
