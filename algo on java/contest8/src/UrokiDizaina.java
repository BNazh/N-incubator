import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


public class UrokiDizaina {

    static String[] first, last;
    static int n, p[];

    static boolean possible(int i)
    {
        if(i == n) return true;
        int pre_idx = p[i - 1], cur_idx = p[i];
        if(first[cur_idx].compareTo(first[pre_idx]) < 0 && first[cur_idx].compareTo(last[pre_idx]) < 0)
            first[cur_idx] = null;
        if(last[cur_idx].compareTo(first[pre_idx]) < 0 && last[cur_idx].compareTo(last[pre_idx]) < 0)
            last[cur_idx] = null;
        if(first[cur_idx] == null && last[cur_idx] == null)
            return false;
        if(first[cur_idx] == null)
            first[cur_idx] = last[cur_idx];
        if(last[cur_idx] == null)
            last[cur_idx] = first[cur_idx];
        return possible(i + 1);

    }
    public static void main(String[] args) throws NumberFormatException, IOException
    {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        n = Integer.parseInt(br.readLine());
        first = new String[n];
        last = new String[n];
        for(int i = 0; i < n; i++)
        {
            StringTokenizer st = new StringTokenizer(br.readLine());
            first[i] = st.nextToken();
            last[i] = st.nextToken();
        }
        p = new int[n];
        StringTokenizer st = new StringTokenizer(br.readLine());
        for(int i = 0; i < n; i++)
            p[i] = Integer.parseInt(st.nextToken()) - 1;

        System.out.println(possible(1)?"YES":"NO");

    }





}