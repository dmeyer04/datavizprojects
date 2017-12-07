class Point {
    public float x;
    public float y;

    public Point copy() {
      Point c = new Point();
      c.x = this.x;
      c.y = this.y;
      return c;
    }
}
