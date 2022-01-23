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
final int W_SIZE = 800;
Boxers boxers;
Shorts shorts;


void settings(){
    size(W_SIZE,W_SIZE);
}

void setup(){
    textFont(createFont("Meiryo", 50));
    boxers = new Boxers(0,0);
    shorts = new Shorts();
}

void draw(){
    fill(#ffffff);
    stroke(#ffffff);
    background( #000000 );
    boxers.main();

    //if (frameCount > 2000) exit();
}

// like abstract class
class Underwear{
    Underwear(){
    }

    float g_rate(float a){
        return a/((1+sqrt(5))/2);
    }

    void v_line(PVector _en, PVector _ti){
        line(_en.x, _en.y, _ti.x, _ti.y);
    }

    // Underwear is chaos.
    void constellation(){

    }
}