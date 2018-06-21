public class Position{
	private int x;
	private int y;
	Position(int a, int b){
		this.x = a;
		this.y = b;
	}

	public int getX(){
		return x;
	}
	public int getY(){
		return y;
	}

	public void setX(int a){
		this.x = a;
	}

	public void setY(int b){
		this.y = b;
	}

	boolean equals(Position p){
		return this.x == p.x && this.y == p.y;
	}
	@Override
	public String toString(){
		return "("+getX()+", "+getY()+")";
	}
}