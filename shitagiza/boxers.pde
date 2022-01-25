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
  Stars barycenter;

  Boxers() {
    imai = (W_SIZE / gold_rate) /2;
    acrux = imai * gold_rate;
    ginan = acrux - ((acrux - (acrux / gold_rate)) / gold_rate);
    belt = acrux - ginan;
    stars = new ArrayList<Stars>();
    interstellar = imai/10.0;
    next_star_ids = new ArrayList<Integer>();
    barycenter = new Stars(acrux, ginan/2, -1);
  }

  void display() {
    translate(width / 2, belt * 2);
    // Plot the stars.
    discovery();
    // Clarify the outline.
    bordering();
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

  void bordering() {
    Stars first_star = stars.get(first_star_id);

    pushMatrix();
    recursive_search(first_star);
    popMatrix();

    for (int b_id : next_star_ids) {
      stars.get(b_id).display(10, true);
    }
  }

  void recursive_search (Stars _f) {
    float ini_angle;
    float rod = 50.0;
    boolean notFound = true;

    ini_angle = moving_angle(_f);
    translate(_f.x, _f.y);
    for (float _angle=ini_angle; notFound; _angle+=0.5){
      rotate(_angle);
      if (next_star_ids.size() > 5) break;
      for (Stars _star : stars){
        if (_f.id == _star.id) continue;
        if (_star.x < (rod / gold_rate ) && _star.y < rod) {
          if (isExistinArray(next_star_ids, _star.id)) continue;
          notFound = false;
          if (_star.id == first_star_id) break;
          next_star_ids.add(_star.id);
          println(_f.id+"  →  FOUND  →  " + _star.id);
          recursive_search(_star);
        }
      }
      if(notFound) {
          if (_angle > ini_angle + 360.0) {
            _angle = ini_angle;
            rod += rod / 10.0;
          }
        }
      }
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

  float moving_angle(Stars _f){
    PVector s = new PVector(_f.x, _f.y);
    PVector b = new PVector(barycenter.x, barycenter.y);
    float angle = PVector.angleBetween(new PVector(1, 0), s.sub(b));
    return angle;
  }
}
