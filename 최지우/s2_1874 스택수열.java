import java.io.*;
import java.util.Stack;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        int n = Integer.parseInt(br.readLine());

        Stack<Integer> stack = new Stack<>();
        stack.push(0);
        int k = 1;
        for(int i=0; i<n; i++) {
            int num = Integer.parseInt(br.readLine());

            if(stack.peek() < num) {
                while(k<=num) {
                    stack.push(k++);
                    sb.append("+").append("\n");
                } 
            } 
            if(stack.peek() == num) {
                stack.pop();
                sb.append("-").append("\n");

            } else {
                sb.setLength(0);
                sb.append("NO").append("\n");
                break;
            }
        }
        System.out.println(sb);
    }
}
