public class Potenssi {
	public static double potenssi(double x, int n) {
		double tulos = 0;
		if (n==0) {
			tulos = 1;
		}
		else if (n%2==1) { //Parittomat luvut
			tulos = x*potenssi(x, n-1);
		}
		else if (n%2==0) { //Parilliset luvut
			double apu = potenssi(x, n/2);
			tulos = apu*apu;
		}
		return tulos;
	}
	
	public static void main(String[] args) {
		System.out.println(potenssi(3, 11));
		System.out.println(potenssi(2, 35));
		System.out.println(potenssi(2, 150));
		System.out.println(potenssi(5, 243));
		System.out.println(potenssi(50, 100));
		System.out.println(potenssi(45, 45));
	}
}