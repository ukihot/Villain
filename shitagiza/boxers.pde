class Boxers extends Underwear {
  /*
   *      -a   ______|_____
   *       ___ |_____|_____|_____> x
   *           /     |     \
   *  g(a)=g  /      |      \ y = (g/g(g))x
   *       a /~~~~~~/|\~~~~~~\
   *                 ↓
   *                 y
   */
  float imai, acrux, ginan;
  float belt;
  ArrayList<Stars> stars;
  float interstellar;
  ArrayList<Stars> next_stars;

  Boxers() {
    imai = (W_SIZE / gold_rate) /2;
    acrux = imai * gold_rate;
    ginan = acrux - ((acrux - (acrux / gold_rate)) / gold_rate);
    belt = acrux - ginan;
    stars = new ArrayList<Stars>();
    interstellar = imai/10.0;
    next_stars = new ArrayList<Stars>();
  }

  void display() {
    println("試行："+frameCount);
    translate(width / 2, belt * 2);
    // Plot the stars.
    discovery();
    // Clarify the outline.
    make_outline();
    all();
  }

  //make Stars-List
  void discovery() {
    Stars originator = new Stars(0, 0, -1);
    for (int p = 0; p < number_stars; p++) {
      float _x = random(-imai, imai);
      float _y = random(-belt, acrux);
      float md = 0.0;
      Stars star;
      int first_star_id = 0;

      if (_y > 0) {
        star = new Stars(thigh_func(_x, _y), _y, p);
      } else {
        star = new Stars(_x, _y, p);
      }
      stars.add(star);
      if (0 > _y && 0 > _x && mag(_x, _y) > md) {
        md = mag(_x, _y);
        originator = star;
      }
    }
    next_stars.add(originator);
  }

  void all() {
    for (Stars _s : stars) {
      _s.display(2, false);
    }
  }

  //TODO: ここも再帰するのでは？
  void make_outline (){
    Stars first_star = stars.get(0);
    float rod = 10.0;
    next_star(first_star, rod);

    for (Stars b : next_stars) {
      b.display(10, true);
    }
  }

  //TODO: 角度計算しかしてないからrodが意味ない
  Stars next_star (Stars _f, float rod){
    float theta = 5.0;
    PVector root = _f.x_axis.setMag(rod);
    for (float angle = 0.0; angle < 360.0; angle += theta){
      for (Stars _star: stars){
        PVector n = _star.y_axis.sub(_f.y_axis);
        if (degrees(PVector.angleBetween(root, n)) < theta && !isExistinArray(next_stars, _star.id)){
          println(_star.id);
          next_stars.add(_star);
          return _star;
        }
      }
      root = r_vec(root, theta);
    }
    return next_star(_f, rod*1.1);
  }

  float thigh_func(float _x, float _y) {
    float intercept = random(-(gold_rate*imai), ginan);
    if (_x > 0) {
      return (_y - intercept) / gold_rate;
    } else {
      return (intercept - _y) / gold_rate;
    }
  }
  PVector r_vec(PVector tar, float phi){
    phi = radians(phi);
    float rx = cos(phi) * tar.x -sin(phi) * tar.y;
    float ry = sin(phi) * tar.x +cos(phi) * tar.y;
    return new PVector(rx, ry);
  }
}
