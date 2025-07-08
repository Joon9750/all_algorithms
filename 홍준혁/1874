import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        int[] targetSequence = new int[n];
        
        for (int i = 0; i < n; i++) {
            targetSequence[i] = sc.nextInt();
        }
        
        Stack<Integer> stack = new Stack<>();
        StringBuilder operations = new StringBuilder();
        int current = 1; // 다음에 push할 숫자
        
        for (int target : targetSequence) {
            // target까지 필요한 숫자들을 push
            while (current <= target) {
                stack.push(current);
                operations.append("+\n");
                current++;
            }
            
            // 스택의 top이 target과 같으면 pop
            if (!stack.isEmpty() && stack.peek() == target) {
                stack.pop();
                operations.append("-\n");
            } else {
                // 불가능한 경우
                System.out.println("NO");
                return;
            }
        }
        
        // 모든 연산 출력
        System.out.print(operations.toString());
        sc.close();
    }
}
