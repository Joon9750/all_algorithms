import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder output = new StringBuilder();
        int T = Integer.parseInt(br.readLine());
        
        for (int t = 0; t < T; t++) {
            String commands = br.readLine();
            int n = Integer.parseInt(br.readLine());
            String arrayStr = br.readLine();
            
            Deque<Integer> deque = new ArrayDeque<>();
            if (n > 0) {
                arrayStr = arrayStr.substring(1, arrayStr.length() - 1);
                if (!arrayStr.isEmpty()) {
                    for (String num : arrayStr.split(",")) {
                        deque.offer(Integer.parseInt(num));
                    }
                }
            }
            
            boolean isReversed = false;
            boolean hasError = false;
            
            for (char cmd : commands.toCharArray()) {
                if (cmd == 'R') {
                    isReversed = !isReversed;
                } else if (cmd == 'D') {
                    if (deque.isEmpty()) {
                        hasError = true;
                        break;
                    }
                    
                    if (isReversed) {
                        deque.pollLast();
                    } else {
                        deque.pollFirst();
                    }
                }
            }
            
            if (hasError) {
                output.append("error\n");
            } else {
                output.append("[");
                if (!deque.isEmpty()) {
                    if (isReversed) {
                        Iterator<Integer> it = deque.descendingIterator();
                        output.append(it.next());
                        while (it.hasNext()) {
                            output.append(",").append(it.next());
                        }
                    } else {
                        Iterator<Integer> it = deque.iterator();
                        output.append(it.next());
                        while (it.hasNext()) {
                            output.append(",").append(it.next());
                        }
                    }
                }
                output.append("]\n");
            }
        }
        
        System.out.print(output.toString());
    }
}
