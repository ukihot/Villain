/**
                                  ■                             ■   
  ■■■■   ■     ■■  ■■ ■■■■■■■■   ■■      ■■■■■   ■■  ■■■■■■■   ■■   
 ■   ■■  ■     ■■  ■■    ■       ■■     ■■   ■   ■■       ■    ■■   
 ■       ■     ■■  ■■    ■      ■■ ■   ■■        ■■      ■    ■■ ■  
 ■■■     ■     ■■  ■■    ■      ■  ■   ■         ■■     ■■    ■  ■  
   ■■■   ■■■■■■■■  ■■    ■      ■  ■■  ■    ■■■  ■■    ■■     ■  ■■ 
     ■■  ■     ■■  ■■    ■     ■■■■■■  ■      ■  ■■   ■■     ■■■■■■ 
      ■  ■     ■■  ■■    ■     ■    ■  ■■     ■  ■■   ■      ■    ■ 
 ■   ■■  ■     ■■  ■■    ■    ■■    ■■  ■■   ■■  ■■  ■      ■■    ■■
  ■■■■   ■     ■■  ■     ■    ■      ■   ■■■■■   ■  ■■■■■■■■■      ■
 @author @goziu
 All comments are translations by DeepL.
 I drew the underwear, incorporating simple particle simulations I had experienced in my master's program.
 */
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 400;
Boxers boxers;
void settings() {
  size(W_SIZE, W_SIZE);
}
void setup() {
  textFont(createFont("Meiryo", 11));
}
void draw() {
  background(#151515);
  boxers = new Boxers();
  boxers.display();
  noLoop();
}
void mouseReleased() {
  loop();
}
// Utils like abstract class
class Underwear {
  final float gold_rate = (sqrt(5.0) + 1.0) / 2.0;
  final int number_stars = 100;
  ArrayList < ArrayList < Stars >> encyclopedia = new ArrayList < ArrayList <
    Stars >> ();
  Underwear() {
  }
  void v_line(Stars _en, Stars _ti) {
    stroke(random(255), random(255), random(255), random(255));
    strokeWeight(random(8));
    line(_en.x, _en.y, _ti.x, _ti.y);
  }
  boolean isCross(Stars head1, Stars tail1, Stars head2, Stars tail2) {
    float ta = (head1.x - tail2.x) * (head2.y - head1.y) + (head1.y - tail2.y) *
      (head1.x - head2.x);
    float tb = (head1.x - tail2.x) * (tail2.y - head1.y) + (head1.y - tail2.y) *
      (head1.x - tail2.x);
    float tc = (head2.x - tail2.x) * (head1.y - head2.y) + (head2.y - tail2.y) *
      (head2.x - head1.x);
    float td = (head2.x - tail2.x) * (tail2.y - head2.y) + (head2.y - tail2.y) *
      (head2.x - tail2.x);
    return tc * td < 0 && ta * tb < 0;
  }
  void reg(Stars _head, Stars _tail) {
    ArrayList < Stars > new_page = new ArrayList < Stars > ();
    new_page.add(_head);
    new_page.add(_tail);
    encyclopedia.add(new_page);
  }

  boolean isExistinArray(ArrayList <Stars> _target, int p) {
    for (Stars _s : _target) {
      if (_s.id == p) return true;
    }
    return false;
  }

  void check_axis(int id) {
    // x-axis
    stroke(#AA0000);
    line(0, 0, 100, 0);
    // y-axis
    stroke(#00AAAA);
    line(0, 0, 0, 100);
    text(id, 0, 0);
  }

  PVector r_vec(PVector tar, float phi) {
    phi = radians(phi);
    float rx = cos(phi) * tar.x -sin(phi) * tar.y;
    float ry = sin(phi) * tar.x +cos(phi) * tar.y;
    return new PVector(rx, ry);
  }

  boolean compare_angle (PVector root, PVector n) {
    PVector x = new PVector(1, 0);
    float theta = degrees(PVector.angleBetween(x, root));
    float phi = degrees(PVector.angleBetween(x, n));
    boolean flag = false;

    if (root.y < 0) {
      if (theta > phi) flag = true;
    } else {
      if (theta < phi) flag = true;
    }
    return flag;
  }

  Stars most_min (ArrayList<Stars> target) {
    Stars originator = new Stars(0, 0, -1);
    float md = 0.0;
    float mx = 0.0;
    float my = 0.0;

    for (Stars _s : target) {
      float _x = _s.x;
      float _y = _s.y;
      if (my > _y && mx > _x && mag(_x, _y) > md) {
        md = mag(_x, _y);
        my = _y;
        mx = _x;
        originator = _s;
      }
    }
    return originator;
  }
}