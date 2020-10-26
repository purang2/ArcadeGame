package entity;

public class Axis {
  private int x;
  private int y;
  private int size;

  public int getSize() {
    return size;
  }

  public Axis(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  public Axis() {}

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}
