import java.io.*;
import java.util.*;

public class s3_1966 {

    static int n,m;
    static Queue<List<Integer>> queue = new LinkedList<>();
    static List<Integer> visited = new ArrayList<>();
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
  
    public static void main(String[] args) throws IOException {

        int t = Integer.parseInt(br.readLine());

        while(t-->0) {
            init();
            input();
            solve();
        }
    }

    static void init() {
        queue.clear();
        visited.clear();
    }

    static void input() throws IOException {

        StringTokenizer st = new StringTokenizer(br.readLine());
        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());
        st = new StringTokenizer(br.readLine());
        
        for(int i=0; i<n; i++) {
            int num = Integer.parseInt(st.nextToken());
            visited.add(num);
            queue.add(new ArrayList<>(Arrays.asList(i, num)));
        }
        Collections.sort(visited, Collections.reverseOrder());
    }

    static void solve() {
        int res=0, cnt=1;
        while(true) {
            int max = visited.remove(0);

            while(true) {
                List<Integer> list = queue.poll();

                if(list.get(1)==max) {
                    if(list.get(0)==m) res = cnt;
                    cnt++;
                    break;
                } else {
                    queue.add(list);
                }
            }
            if(res!=0) break;
        }
        System.out.println(res);
    }

}
