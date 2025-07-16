import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        TreeMap<Integer, Integer> map = new TreeMap<>();

        int t = Integer.parseInt(br.readLine());
        for (int i = 0; i < t; i++) {
            map.clear();    // 반드시 map 초기화
            int k = Integer.parseInt(br.readLine());

            for (int j = 0; j < k; j++) {
                String[] input = br.readLine().split(" ");
                String command = input[0];
                int value = Integer.parseInt(input[1]);
                if (command.equals("I")) {
                    map.put(value, map.getOrDefault(value, 0) + 1);
                } else if (command.equals("D")) {
                    if (map.isEmpty()) {    // 힙 비어있으면 continue
                        continue;
                    }

                    if (value == 1) {
                        int max = map.lastKey();
                        map.put(max, map.get(max) - 1);
                        if (map.get(max) == 0) {
                            map.remove(max);
                        }
                    } else if (value == -1) {   // 최솟값 삭제
                        int min = map.firstKey();
                        map.put(min, map.get(min) - 1);
                        if (map.get(min) == 0) {
                            map.remove(min);
                        }
                    }
                }
            }

            if (map.isEmpty()) {
                bw.write("EMPTY\n");
            } else {
                bw.write(map.lastKey() + " " + map.firstKey() + "\n");
            }
        }

        bw.flush();
        bw.close();
        br.close();
    }
}
