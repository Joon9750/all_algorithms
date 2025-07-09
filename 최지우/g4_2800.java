import java.io.*;
import java.util.*;

public class g4_2800 {
    static List<List<Integer>> pair = new ArrayList<>();
    static String input;
    static Set<String> result = new TreeSet<>(); 

    static void choosePair() {
        Stack<Integer> stack = new Stack<>();
        for (int i = 0; i < input.length(); i++) {
            if (input.charAt(i) == '(') stack.push(i);
            else if (input.charAt(i) == ')') {
                int left = stack.pop();
                pair.add(Arrays.asList(left, i));
            }
        }
    }

    static void dfs(int depth, boolean[] removed) {
        if (depth == pair.size()) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < input.length(); i++) {
                boolean skip = false;
                for (int j = 0; j < pair.size(); j++) {
                    if (removed[j] && (i == pair.get(j).get(0) || i == pair.get(j).get(1))) {
                        skip = true;
                        break;
                    }
                }
                if (!skip) sb.append(input.charAt(i));
            }
            if (!sb.toString().equals(input)) {
                result.add(sb.toString());
            }
            return;
        }

        removed[depth] = true;
        dfs(depth + 1, removed);

        removed[depth] = false;
        dfs(depth + 1, removed);
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        input = br.readLine();

        choosePair();
        dfs(0, new boolean[pair.size()]);

        for (String s : result) {
            System.out.println(s);
        }
    }
}
