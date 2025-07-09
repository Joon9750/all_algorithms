# Data Structrue
## 괄호 제거 [2800_G4]
### 알고리즘 분류
`스택` / `DFS`
### 접근

1. 괄호 순서쌍의 index를 stack을 이용해 모두 구하기
```swift
let expr = readLine()!.enumerated()
var stack = [(Character, Int)]()
var pairs = [(Int, Int)]()

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
```

2. pairs에서 1...n개의 순서쌍을 뽑고, 뽑힌 순서쌍 내 index들을 담은 집합(괄호를 지우는 하나의 경우의 수) 만들기
```swift
var toRemove = [Set<Int>]()

for i in 1...pairs.count {
    var set = Set<Int>()
    dfs(&set, 0, i)
}

// 순서쌍 인덱스만 파라미터로 받고, 완료 조건에 걸렸을 때 제거해야 할 전체 인덱스 set 생성
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
```
괄호 쌍 개수가 최대 10개이므로, 최대 toRemoveSet의 개수는 2^10 - 1(제거하지 않는 경우) = 1023. 완전 탐색 가능

3. 출력 문자열 생성, 정렬, 출력
```swift
for i in 0..<toRemove.count {
    var str = ""
    for (idx, elem) in expr {
        if toRemove[i].contains(idx) { continue }
        str.append(elem)
    }
    results.insert(str)
}

print(Array(results).sorted().joined(separator: "\n"))
```
문자열 최대 길이가 200이므로 문자열 순회 가능
### 디버깅
하나의 식을 여러 괄호 쌍이 감싸는 경우를 고려하지 못했었다.
```
input:
((1 + 2))
expected:
(1 + 2)
1 + 2
output:
(1 + 2)
(1 + 2)
1 + 2
```
`var results`를 `[String]` -> `Set<String>`으로 바꿔서 해결
