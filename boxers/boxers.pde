//
// All comments are translations by DeepL.
//
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 400;
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
    translate(76,153);
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
    public float b_width, b_height;
    public PVector mizar, dubhe, benetonasch, merak, megrez;
    public PVector alioth, phecda;

    underwear(){
        // Just define the size.
        b_width = g_rate(W_SIZE);
        b_height = g_rate(b_width);
        mizar = new PVector(0, 0);
        dubhe = new PVector(b_width, 0);
        benetonasch = new PVector(-b_width/6, b_height);
        merak = new PVector(b_width*7/6, b_height);
        megrez = new PVector(b_width/2, g_rate(b_height));
        alioth = new PVector(b_width/3, b_height);
        phecda = new PVector(b_width*2/3, b_height);
    }

    void manifestation(){
        // Waist of boxer shorts.
        strokeWeight( 3 );
        stroke( #f8a2ab );
        beginShape();
        for (float i = mizar.x; i <= dubhe.x; i+=b_width/24) {
            vertex(i , noise(i,i)*4);
        }
        endShape();

        // The line on the right side of the right foot.
        stroke( #0033a0 );
        beginShape();
        float j = benetonasch.y;
        for (float i = benetonasch.x; i <= mizar.x; i+=b_width/24){
            vertex(i, j);
            j -= benetonasch.y/24;
        }
        endShape();

        // Lower line of the right foot.
    }

    float g_rate(float a){
        float co =  (1+sqrt(5))/2;
        return a/co;
    }
}