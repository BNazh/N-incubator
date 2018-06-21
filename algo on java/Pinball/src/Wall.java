import javafx.geometry.Point2D;
import javafx.scene.shape.Line;

public abstract class Wall {
	
	public abstract double getStartX() ;
	public abstract double getEndX() ;
	public abstract double getStartY() ;
	public abstract double getEndY() ;
	
	public abstract boolean isHorizontal() ;
	public abstract boolean isVertical() ;
	
	public abstract Point2D getIntersectionFrom(Point2D origin, double angle) ;
	
	private Line line ;
	
	public Line asLine() {
		if (line == null) {
			line = new Line(getStartX(), getStartY(), getEndX(), getEndY());
		}
		return line ;
	}
	
	@Override
	public String toString() {
		return String.format("[%.2f, %.2f] -> [%.2f, %.2f]", getStartX(), getStartY(), getEndX(), getEndY());
	}
}
