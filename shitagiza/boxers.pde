class Boxers extends Underwear{
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

    Boxers(){
        // -imai/2 < x < imai/2
        imai = W_SIZE / g;
        // -(acrux-ginan) < y < acrux
        acrux = imai/2 * g;
        ginan = acrux - ((acrux - (acrux / g)) / g);
    }

    void main(){
        translate(width / 2, ginan);
        stroke(0, 0, 225);
        strokeWeight(9);
        point(0, 0);
        text(frameCount, 100,height/2);
        text("IMAI", imai/2, 0);
        text("GINAN", 0, ginan);
        text("ACRUX", 0, acrux);
        

    }
}