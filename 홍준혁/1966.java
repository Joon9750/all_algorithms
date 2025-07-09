import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        
        for (int t = 0; t < T; t++) {
            int N = sc.nextInt();
            int M = sc.nextInt();
            
            Queue<int[]> queue = new LinkedList<>();
            
            for (int i = 0; i < N; i++) {
                int priority = sc.nextInt();
                queue.offer(new int[]{priority, i});
            }
            
            int printOrder = 0;
            
            while (!queue.isEmpty()) {
                int[] current = queue.poll();
                int currentPriority = current[0];
                int currentIndex = current[1];
                
                boolean hasHigherPriority = false;
                for (int[] doc : queue) {
                    if (doc[0] > currentPriority) {
                        hasHigherPriority = true;
                        break;
                    }
                }
                
                if (hasHigherPriority) {
                    queue.offer(current);
                } else {
                    printOrder++;
                    if (currentIndex == M) {
                        System.out.println(printOrder);
                        break;
                    }
                }
            }
        }
        
        sc.close();
    }
}
