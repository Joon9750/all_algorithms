// 테스트 케이스 수
let t = Int(readLine()!)!

for _ in 0..<t {
    let operators = readLine()! // 수행할 연산들
    let n = Int(readLine()!)! // 원소 개수
    let deque = readLine()!.dropFirst().dropLast().split(separator: ",") // 입력 배열 전처리 후 저장

    var isReversed = false // 배열이 뒤집혀 있는지 여부 저장
    var isError = false // 에러인지 여부 저장
    var front = 0 // front index
    var back = n - 1 // back index

    for op in operators {
        switch op {
        case "R": isReversed.toggle() // reverse
        case "D": // delete
            guard front <= back else { // front > back -> 배열이 비어 있는 상태
                isError = true
                break
            }
            if isReversed { back -= 1 } // reversed이면 back index 감소
            else { front += 1 } // 아니면 front index 증가
        default: continue
        }
    }

    let output: String = {
        if isError { return "error" }
        else if front > back { return "[]" }
        else if isReversed { return "[" + deque[front...back].reversed().joined(separator: ",") + "]" }
        else { return "[" + deque[front...back].joined(separator: ",") + "]" }
    }()

    print(output)
}
