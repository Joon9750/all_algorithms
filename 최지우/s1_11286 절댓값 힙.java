import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        int N = Integer.parseInt(br.readLine());
        PriorityQueue<Integer> pq = new PriorityQueue<>(new Comparator<Integer>() {
            @Override
            public int compare(Integer a, Integer b) {
                int absA = Math.abs(a);
                int absB = Math.abs(b);

                if(absA!=absB) {
                    return absA-absB;
                } 
                return a-b;
            }
        });

        while(N-- > 0) {
            int n = Integer.parseInt(br.readLine());

            if(n==0) {
                sb.append(pq.isEmpty() ? 0 : pq.poll()).append("\n");
            } else { 
                pq.add(n);
            }
        }
        System.out.println(sb);
    }
}
