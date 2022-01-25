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
  int first_star_id;
  ArrayList<Integer> next_star_ids;

  Boxers() {
    imai = (W_SIZE / gold_rate) /2;
    acrux = imai * gold_rate;
    ginan = acrux - ((acrux - (acrux / gold_rate)) / gold_rate);
    belt = acrux - ginan;
    stars = new ArrayList<Stars>();
    interstellar = imai/10.0;
    next_star_ids = new ArrayList<Integer>();
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
    for (int p = 0; p < number_stars; p++) {
      float _x = random(-imai, imai);
      float _y = random(-belt, acrux);
      float mx = 0.0;
      float my = 0.0;
      float md = 0.0;
      Stars star;
      check_axis(0);
      if (_y > 0) {
        star = new Stars(thigh_func(_x, _y), _y, p);
      } else {
        star = new Stars(_x, _y, p);
        float _d = dist(0, 0, star.x, star.y);
        if (my > _y && mx > _x && _d > md) {
          mx = _x;
          my = _y;
          md = _d;
          first_star_id = p;
        }
      }
      stars.add(star);
    }
    next_star_ids.add(first_star_id);
  }

  void all() {
    for (Stars _s : stars) {
      _s.display(1, false);
    }
  }

  void make_outline (){
    Stars first_star = stars.get(first_star_id);
    float rod = W_SIZE / 10.0;
    next_star(first_star, rod);

    for (int b_id : next_star_ids) {
      stars.get(b_id).display(10, true);
    }
  }

  Stars next_star (Stars _f, float rod){
    float theta = 5.0;
    PVector root = _f.x_axis.setMag(rod);
    for (float angle = 0.0; angle < 360.0; angle += theta){
      for (Stars _star: stars){
        PVector n = _star.y_axis.sub(_f.y_axis);
        if (degrees(PVector.angleBetween(root, n)) < theta && !isExistinArray(next_star_ids, _star.id)){
          println(_star.id);
          next_star_ids.add(_star.id);
          return _star;
        }
      }
      root = r_vec(root, theta);
    }
    return next_star(_f, rod*1.1);
  }

  // Neighborhood-connect
  // void n_connect(){
  //     for (Stars _head : stars) {
  //         for (Stars _tail : stars){
  //             if (_head.id == _tail.id) continue;
  //             if (dist(_head.x, _head.y, _tail.x, _tail.y) > interstellar) continue;
  //             reg(_head, _tail);
  //         }
  //     }
  //     for (ArrayList<Stars> book1 : encyclopedia){
  //         Stars head1=stars.get(book1.get(0).id);
  //         Stars tail1=stars.get(book1.get(1).id);
  //         for (ArrayList<Stars> book2 : encyclopedia){
  //             Stars head2=stars.get(book2.get(0).id);
  //             Stars tail2=stars.get(book2.get(1).id);
  //             if (!isCross(head1, tail1, head2, tail2)){
  //             }
  //         }
  //         v_line(head1, tail1);
  //     }
  // }

  // Random-connect
  // void r_connect(){
  //     int gon_max = 5;
  //     for (int j = 0; j < s-gon_max; j++){
  //         int gon = int(random(2, gon_max));
  //         fill(random(255),random(255),random(255), random(255));
  //         stroke(random(255),random(255),random(255), random(255));
  //         strokeWeight(map(noise(j),0,1,0,8));
  //         beginShape();
  //         curveVertex(stars.get(j).x, stars.get(j).y);
  //         curveVertex(stars.get(j).x, stars.get(j).y);
  //         for (int index = j+1; index <= j + gon; index++){
  //             curveVertex(stars.get(index).x, stars.get(index).y);
  //         }
  //         curveVertex(stars.get(j).x, stars.get(j).y);
  //         curveVertex(stars.get(j).x, stars.get(j).y);
  //         endShape();
  //         j += gon;
  //     }
  // }

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
