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
    ArrayList<Stars> stars;

    Boxers(){
        // -imai/2 < x < imai/2
        imai = W_SIZE / g;
        // -(acrux-ginan) < y < acrux
        acrux = imai/2 * g;
        ginan = acrux - ((acrux - (acrux / g)) / g);
        stars = new ArrayList<Stars>();
    }

    void main(){
        translate(width / 2, ginan);
        text(frameCount, 100,height/2);
        discovery();
        for (Stars s : stars) {
            s.display();
        }
    }

    void discovery(){
        float _sx;
        float _sy;
        float l = (acrux-ginan);

        for (p = 0; p < s ; p++){
            _sx = random(-imai/2, imai/2);
            _sy = random(-l, acrux);
            Stars star = new Stars(_sx, _sy);
            stars.add(star);
        }
    }
}