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
Shorts shorts;

void settings(){
    size(W_SIZE,W_SIZE);
}

void setup(){
    textFont(createFont("Meiryo", 10));
}

void draw(){
    background( #151515 );
    boxers = new Boxers();
    boxers.main();
    shorts = new Shorts();
    //noLoop();
    //if (frameCount > 2000) exit();
    if (mousePressed == true) noLoop();
}

void mouseReleased() {
    loop();
}

// Util like abstract class
class Underwear{
    final float gold_rate = (sqrt(5.0) + 1.0 ) / 2.0;
    final int number_stars = 100;
    ArrayList<ArrayList<Stars>> encyclopedia = new ArrayList<ArrayList<Stars>>();

    Underwear(){
    }

    void v_line(PVector _en, PVector _ti){
        line(_en.x, _en.y, _ti.x, _ti.y);
    }

    boolean isCross(Stars head1, Stars tail1, Stars head2, Stars tail2){
        float ta = (head1.x - tail2.x) * (head2.y - head1.y) + (head1.y - tail2.y) * (head1.x - head2.x);
        float tb = (head1.x - tail2.x) * (tail2.y - head1.y) + (head1.y - tail2.y) * (head1.x - tail2.x);
        float tc = (head2.x - tail2.x) * (head1.y - head2.y) + (head2.y - tail2.y) * (head2.x - head1.x);
        float td = (head2.x - tail2.x) * (tail2.y - head2.y) + (head2.y - tail2.y) * (head2.x - tail2.x);
        return tc * td < 0 && ta * tb < 0;
    }
}