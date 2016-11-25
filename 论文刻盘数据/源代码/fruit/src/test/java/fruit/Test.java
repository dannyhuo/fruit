package fruit;

/**
 * 踩过的坑，8大基本数据类型与其对应的类相互赋值需注意
 * @author huoqiang
 *
 */
public class Test {
	public static void main(String[] args) {
		Cat cat = new Cat();
		Dog dog = new Dog();
		cat.setA(dog.getB());
	}
}

class Cat{
	private int a;
	
	public void setA(int a){
		this.a = a;
	}
	
	public int getA(){
		return this.a;
	}
}

class Dog{
	private Integer b;
	
	public void setB(Integer b){
		this.b = b;
	}
	
	public Integer getB(){
		return this.b;
	}
}
