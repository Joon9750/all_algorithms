import java.util.*;
import java.io.*;

public class Main {

    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    static BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
    static StringTokenizer st;
    static HashMap<String, Integer> map = new HashMap<>();

    public static void main(String[] args) throws IOException {
        String s;
        int count = 0;
        while((s = br.readLine()) != null && s.length() != 0){
            map.put(s, map.getOrDefault(s,0) + 1);
            count++;
        }

        ArrayList<String> keySet = new ArrayList<>(map.keySet());
        Collections.sort(keySet);
        for (String string : keySet) {
            String result = String.format("%.4f",(double)map.get(string)*100/(double)count);
            bw.write(string + " " + result + '\n');
        }
        bw.flush();
        bw.close();
    }
}
