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
      int first_star_id = 0;

      if (_y > 0) {
        star = new Stars(thigh_func(_x, _y), _y, p);
      } else {
        star = new Stars(_x, _y, p);
      }
      stars.add(star);
    }
    next_stars.add(most_min(stars));
  }

  //TODO: ここも再帰するのでは？
  void make_outline (){
    Stars first_star = next_stars.get(0);
    println("初星："+first_star.id);
    next_star(first_star, 0.0, 5.0);
    for (Stars b : next_stars) {
      b.display(10, true);
    }
  }

  Stars next_star (Stars _f, float theta, float search_range){
    float angle = 5.0;
    float rod_len = 5.0;
    float ja = 0.0;
    float jd = 0.0;
    PVector root = PVector.sub(r_vec(_f.y_axis, theta),_f.y_axis);
    println("【"+_f.id+"】"+"現在の角度："+theta+"現在の長さ："+search_range);

    for (Stars _star: stars){
      if (_f.id == _star.id) continue;
      PVector n = PVector.sub(_star.y_axis, _f.y_axis);
      ja = degrees(PVector.angleBetween(root, n));
      jd = PVector.dist(_f.y_axis, _star.y_axis);
      if (compare_angle(_f.y_axis, _star.y_axis) &&ja < angle && jd < search_range){
        if (_star.id == next_stars.get(0).id){
        println("trace完了");
        return _star;
        }
        if (!isExistinArray(next_stars, _star.id)){
        next_stars.add(_star);
        return next_star(_star, 0.0, rod_len);
        }
      }
    }
    if (theta+angle > 360.0){
      theta = 0.0;
      search_range += rod_len;
    }
    return next_star(_f, theta+angle, search_range);
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
