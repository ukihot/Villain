//
// All comments are translations by DeepL.
//
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 400;
final float BW = 247.21;
final float BH = 152.79;
underwear boxers;

void settings(){
    size(W_SIZE,W_SIZE);
}

void setup(){
    background( #ffffff );
    textFont(createFont("Meiryo", 50));
    boxers = new underwear();
}

void draw(){
    translate((W_SIZE-BW)/2,W_SIZE/2-g_rate(BH));
    boxers.manifestation();
}

class underwear {
    //                [Big Dipper]
    //         Mizar  ._________. Dubhe
    //               /           \
    //              /      .Megrez\
    // Benetonasch ._____./ \._____.
    //                Alioth  Phecda Merak
    //
    public PVector mizar, dubhe, benetonasch, merak, megrez, alioth, phecda;

    underwear(){
        // Just define the size.
        mizar = new PVector(0, 0);
        dubhe = new PVector(BW, 0);
        benetonasch = new PVector(-BW/6, BH);
        merak = new PVector(BW*7/6, BH);
        megrez = new PVector(BW/2, g_rate(BH));
        alioth = new PVector(BW/3, BH);
        phecda = new PVector(BW*2/3, BH);
    }

    void manifestation(){
        // Waist of boxer shorts.
        strokeWeight( 3 );
        stroke( #f8a2ab );
        beginShape();
        for (float i = mizar.x; i <= dubhe.x; i+=BW/24) {
            vertex(i , noise(i,i)*4);
        }
        endShape();

        // The line on the right side of the right foot.
        stroke( #0033a0 );
        beginShape();
        float j = benetonasch.y;
        for (float i = benetonasch.x; i <= mizar.x; i+=BW/24){
            vertex(i, j);
            j -= benetonasch.y/24;
        }
        endShape();

        // Lower line of the right foot.
    }
}

public float g_rate(float a){
        float co =  (1+sqrt(5))/2;
        return a/co;
}