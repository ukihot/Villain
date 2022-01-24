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

  void main() {
    translate(width / 2, belt * 2);
    // Plot the stars.
    discovery();
    // Clarify the outline.
    bordering();
  }

  //make Stars-List
  void discovery() {
    for (int p = 0; p < number_stars; p++) {
      float _x = random(-imai, imai);
      float _y = random(-belt, acrux);
      float mx = 0.0;
      float my = 0.0;
      Stars star;

      if (_y > 0) {
        star = new Stars(thigh_func(_x, _y), _y, p);
      } else {
        star = new Stars(_x, _y, p);
        if (my > _y) {
          my = _y;
          if (mx > _x) {
            mx = _x;
            first_star_id = p;
          }
        }
      }
      stars.add(star);
    }
  }

  void bordering() {
    Stars first_star = stars.get(first_star_id);

    recursive_search(first_star);
    for (int b_id : next_star_ids) {
      stars.get(b_id).display();
    }
  }

  void recursive_search (Stars _f) {
    int ini_angle = 315;
    float rod = 10.0;
    boolean notFound = true;

    pushMatrix();
    translate(_f.x, _f.y);
    rotate(radians(ini_angle));
    for (int _index=0; notFound; _index++){
      Stars _star = stars.get(_index);
      println(_f.id);
      if (_star.x < (rod / gold_rate ) && _star.y < rod) {
        notFound = false;
        if (!isExistinArray(next_star_ids, _star.id)) {
          println("FOUND");
          next_star_ids.add(_star.id);
          recursive_search(_star);
        }
      } else {
        ini_angle++;
        if (ini_angle > 675) {
          ini_angle = 315;
          rod *= 1.5;
        }
        rotate(radians(ini_angle));
      }
      break;
    }
    popMatrix();
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
}
