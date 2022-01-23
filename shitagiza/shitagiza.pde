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
    boxers = new Boxers();
    shorts = new Shorts();
}

void draw(){
    fill(#ffffff);
    stroke(#ffffff);
    background( #000000 );
    boxers.main();
    noLoop();
    //if (frameCount > 2000) exit();
}

// like abstract class
class Underwear{
    final float g = (sqrt(5.0) + 1.0 ) / 2.0;
    final int s = 100;
    Underwear(){
    }

    void v_line(PVector _en, PVector _ti){
        line(_en.x, _en.y, _ti.x, _ti.y);
    }

    // Underwear is one of the constellations.
    void constellation(){

    }
}