class Stars {
  float x, y;
  int id;

  Stars(float _x, float _y, int _p) {
    x = _x;
    y = _y;
    id = _p;
  }

  void display(float w, boolean text) {
    stroke(random(255), random(255), random(255));
    strokeWeight(w);
    point(x, y);
    if (text) text(id+"("+(int)x+","+(int)y+")", x, y);
  }

  float get_id(int _id) {
    return x;
  }

}
