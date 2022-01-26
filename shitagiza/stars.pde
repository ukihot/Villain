class Stars {
  float x, y;
  int id;
  PVector x_axis, y_axis;

  Stars(float _x, float _y, int _p) {
    x = _x;
    y = _y;
    id = _p;
    y_axis = new PVector(x, y);
    x_axis = new PVector(-y, x);
  }

  void display(float w, boolean text) {
    stroke(random(255), random(255), random(255));
    strokeWeight(w);
    point(x, y);
    if (text) text(id, x, y);
  }
}
