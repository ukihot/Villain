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
    background( #ffffff );
    textFont(createFont("Meiryo", 50));
    boxers = new Boxers();
}

void draw(){
    boxers.manifestation();
}

class Underwear{
    Underwear(){
    }

    void manifestation(){}

    float g_rate(float a){
        float co =  (1+sqrt(5))/2;
        return a/co;
    }
    void v_line(PVector a, PVector b){
        line(a.x, a.y, b.x, b.y);
    }
}