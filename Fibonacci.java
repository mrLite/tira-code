public class Fibonacci {
	public static long fib1(int n) {
		long fib_n;
		if (n == 1) {
			fib_n = 1;
		}
		else if (n == 2) {
			fib_n = 1;
		}
		else {
			fib_n = fib1(n-1) + fib1(n-2);
		}
		return fib_n;
	}
	
	public static long fib2(int n) {
		long[] fibos = new long[n];
		if (n == 1) {
			return 1;
		}
		else if (n == 2) {
			return 1;
		}
		else {
			fibos[0] = 1;
			fibos[1] = 1;
			for (int i = 2; i < n; i++) {
				fibos[i] = fibos[i-1]+fibos[i-2];
			}
		}
		return fibos[n-1];
	}
	
	public static long fib3(int n) {
		long eka = -1;
		long tulos = 1;
		for (int i = 0; i <= n; ++i) {
			long summa = eka + tulos;
			eka = tulos;
			tulos = summa;
		}
		return tulos;
	}
	
	public static void main(String[] args) {
		System.out.println("fib1");
		System.out.println(fib1(8));
		System.out.println(fib1(14));
		System.out.println(fib1(34));
		System.out.println(fib1(50));
		System.out.println("fib2");
		System.out.println(fib2(8));
		System.out.println(fib2(14));
		System.out.println(fib2(34));
		System.out.println(fib2(50));
		System.out.println("fib3");
		System.out.println(fib3(8));
		System.out.println(fib3(14));
		System.out.println(fib3(34));
		System.out.println(fib3(50));
	}
}