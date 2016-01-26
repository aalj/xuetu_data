package gem.filter;

public class OnLineCount {
	//变量，记住在线人数 
	private static int count = 0;
	
	//加1
	public static void inc() {
		count++;
	}
	//减1
	public static void dec() {
		count--;
	}
	//获得在线人数
	public static int getCount() {
		return count;
	}
	
}
