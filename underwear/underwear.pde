//
// All comments are translations by DeepL.
//
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 400;
Boxers boxers;
Shorts shorts;

void settings(){
    size(W_SIZE,W_SIZE);
}

void setup(){
    textFont(createFont("Meiryo", 50));
}

void draw(){
    fill(#ffffff);
    stroke(#ffffff);
    background( #000000 );
    boxers = new Boxers();
    shorts = new Shorts();
    boxers.manifestation();

    if (frameCount > 2000) {
        noLoop();
        exit();
    }
}

class Underwear{
    Underwear(){
    }

    void manifestation(){}

    float g_rate(float a){
        float co =  (1+sqrt(5))/2;
        return a/co;
    }

    void v_line(PVector _en, PVector _ti){
        line(_en.x, _en.y, _ti.x, _ti.y);
    }
}