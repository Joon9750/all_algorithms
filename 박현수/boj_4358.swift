import Foundation

var dictionary = [String: Int]()

while let input = readLine() {
    dictionary[input, default: 0] += 1
}

let sum = dictionary.values.reduce(0, +)

let sorted = dictionary.sorted { $0.key < $1.key }

for (key, value) in sorted {
    print("\(key) \(String(format: "%.4f", round(Double(value) / Double(sum) * 1000000) / 10000))")
}
