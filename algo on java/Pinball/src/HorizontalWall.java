import javafx.geometry.Point2D;

public class HorizontalWall extends Wall {
	
	private final double startX ;
	private final double endX ;
	private final double y ;
	
	public HorizontalWall(double startX, double endX, double y) {
		this.startX = Math.min(startX, endX);
		this.endX = Math.max(startX, endX);
		this.y = y ;
	}

	@Override
	public double getStartX() {
		return startX ;
	}

	@Override
	public double getEndX() {
		return endX ;
	}

	@Override
	public double getStartY() {
		return y ;
	}

	@Override
	public double getEndY() {
		return y ;
	}

	@Override
	public Point2D getIntersectionFrom(Point2D origin, double angle) {
		
		// if line is horizontal, there is no intersection:
		if (angle % 180 == 0) return null ;
		
		// if line is pointing away from wall, there is no intersection:
		if ( ((int) angle / 180) % 2 == 0 /* downward (+ve y) */ && y < origin.getY()) return null ;
		if ( ((int) angle / 180) % 2 == 1 /* upward (-ve y) */ && y > origin.getY()) return null ;
		
		// find x-coordinate of intersection:
		double slope = Math.tan(Math.toRadians(angle)) ;
		double x = origin.getX() + (y - origin.getY()) / slope ;
		
		// if x-coordinate is beyond ends of wall, there is no intersection:
		if (x < startX || x > endX) return null ;
		
		// return intersecting point:
		return new Point2D(x, y);
	}

	@Override
	public boolean isHorizontal() {
		return true;
	}

	@Override
	public boolean isVertical() {
		return false;
	}

}
