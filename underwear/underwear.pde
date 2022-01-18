//
// All comments are translations by DeepL.
//
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 400;
final float BW = 247.21;
final float BH = 152.79;
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
    translate((W_SIZE-BW)/2,W_SIZE/2-g_rate(BH));
    boxers.manifestation();
}

class Underwear{
    PVector miz, dub, ben, mer, meg, ali, phe;


    Underwear(PVector _miz, PVector _dub, PVector _ben, PVector _mer, PVector _meg , PVector _ali, PVector _phe){

    }
}

public float g_rate(float a){
        float co =  (1+sqrt(5))/2;
        return a/co;
}