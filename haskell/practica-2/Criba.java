public class Criba {
	public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        criba(n);
    }
    
    private static void criba(int n) {
        int[] arr = new int[n];

        for(int i = 2; i <= n; i++) {
            arr[i-2] = i;
        }
        
        int actual = arr[0];
        for(int i = 0; actual * actual < n; i++) {
            actual = arr[i];
            if (actual != 0) {  
                for (int j = i + 1; j < n; j++) {
                    if (arr[j] != 0 && arr[j] % actual == 0) {
                        arr[j] = 0;
                    }
                }
            }
        }

        System.out.print("[ ");
        for(int i = 0; i < n; i++) { 
            if (arr[i] != 0) {
                System.out.print(arr[i] + ", ");
            }
        }
        System.out.print("]\n");
    }
}