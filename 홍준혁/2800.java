import java.io.*;
import java.util.*;

public class Main {
    static class Pair<T> {
        int index1;
        T index2;

        Pair(int index1, T index2) {
            this.index1 = index1;
            this.index2 = index2;
        }
    }

    static int n;
    static int[] ch;
    static List<Pair<Integer>> mappingList;
    static String str;
    static BufferedWriter bw;
    static Set<String> resultSet = new TreeSet<>();

    public static void DFS(int L) throws IOException {
        if (L == n) {
            List<Integer> deleteIndex = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                if (ch[i] == 1) {
                    Pair<Integer> pair = mappingList.get(i);
                    deleteIndex.add(pair.index1);
                    deleteIndex.add(pair.index2);
                }
            }

            if (!deleteIndex.isEmpty()) {
                StringBuilder sb = new StringBuilder(str);
                deleteIndex.sort(Collections.reverseOrder());

                for (Integer index : deleteIndex) {
                    sb.deleteCharAt(index);
                }

                resultSet.add(sb.toString());
            }
        } else {
            ch[L] = 1;
            DFS(L + 1);
            ch[L] = 0;
            DFS(L + 1);
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        bw = new BufferedWriter(new OutputStreamWriter(System.out));
        str = br.readLine();

        List<String> list = new ArrayList<>();
        for (int i = 0; i < str.length(); i++) {
            list.add(str.substring(i, i + 1));
        }

        ArrayDeque<Pair<String>> deq = new ArrayDeque<>();
        mappingList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).equals("(")) {
                Pair<String> pair = new Pair<String>(i, "(");
                deq.add(pair);
            } else if (list.get(i).equals(")") && !deq.isEmpty()) {
                Pair<String> lastElement = deq.pollLast();
                mappingList.add(new Pair<>(i, lastElement.index1));
            }
        }

        n = mappingList.size();
        ch = new int[n];

        DFS(0);

        for (String result : resultSet) {
            bw.write(result);
            bw.newLine();
        }

        bw.flush();
        bw.close();
    }
}
