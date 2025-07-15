import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        TreeMap<String, Integer> treeMap = new TreeMap<>();
        String str;
        int totalCount = 0;

        while ((str = br.readLine()) != null) {
            treeMap.put(str, treeMap.getOrDefault(str, 0) + 1);
            totalCount++;
        }

        for (Map.Entry<String, Integer> entry : treeMap.entrySet()) {
            String key = entry.getKey();
            double value = (double) entry.getValue() / totalCount * 100;
            
            // DecimalFormat 대신 printf 사용
            bw.write(String.format("%s %.4f\n", key, value));
        }

        bw.flush();
        bw.close();
        br.close();
    }
}
