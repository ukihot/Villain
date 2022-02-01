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
  Stars originator;

  Boxers() {
    imai = (W_SIZE / gold_rate) /2;
    acrux = imai * gold_rate;
    ginan = acrux - ((acrux - (acrux / gold_rate)) / gold_rate);
    belt = acrux - ginan;
    stars = new ArrayList<Stars>();
    interstellar = imai/10.0;
    next_stars = new ArrayList<Stars>();
    originator = new Stars(0, 0, -1);
  }

  void display() {
    println("試行："+frameCount);
    translate(width / 2, belt * 2);
    // Plot the stars.
    discovery();
    // Clarify the outline.
    make_outline();
    for (Stars _s : stars) {
      _s.display(2, false);
    }
  }

  //make Stars-List
  void discovery() {
    for (int p = 0; p < number_stars; p++) {
      float _x = random(-imai, imai);
      float _y = random(-belt, acrux);
      Stars star;

      if (_y > 0) {
        star = new Stars(thigh_func(_x, _y), _y, p);
      } else {
        star = new Stars(_x, _y, p);
      }
      stars.add(star);
    }
    originator = closist(new Stars(-width / 2, -belt * 2, 0), stars);
  }

  void make_outline () {
    for (Stars i = constellation(originator, 0.0); i.id != originator.id; i = constellation(i, 0.0)) {
    }

    for (int i = 0; i< next_stars.size() - 1; i++){
      s_line(next_stars.get(i), next_stars.get(i+1));
    }
  }

  Stars constellation (Stars _f, float theta) {
    float angle = 10.0;
    float ja = 0.0;
    float jd = 0.0;
    PVector root = PVector.sub(r_vec(_f.y_axis, theta), _f.y_axis);
    ArrayList<Stars> candidate = new ArrayList<Stars>();

    for (Stars _star : stars) {
      if (_f.id == _star.id) continue;
      PVector n = PVector.sub(_star.y_axis, _f.y_axis);
      ja = degrees(PVector.angleBetween(root, n));
      jd = PVector.dist(_f.y_axis, _star.y_axis);
      if (ja < 2 && !isExistinArray(next_stars, _star.id)) {
        candidate.add(_star);
      }
    }
    if (candidate.size() != 0){
      Stars r_star = closist(_f, candidate);
      next_stars.add(r_star);
      return r_star;
    }
    if (theta+angle >= 360.0) {
      theta = 0.0;
    }
    return constellation(_f, theta+angle);
  }

  float thigh_func(float _x, float _y) {
    float intercept = random(-(gold_rate*imai), ginan);
    if (_x > 0) {
      return (_y - intercept) / gold_rate;
    } else {
      return (intercept - _y) / gold_rate;
    }
  }
}
