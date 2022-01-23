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
    float belt;
    ArrayList<Stars> stars;

    Boxers(){
        imai = (W_SIZE / g) /2;
        acrux = imai * g;
        ginan = acrux - ((acrux - (acrux / g)) / g);
        belt = acrux - ginan;
        stars = new ArrayList<Stars>();
    }

    void main(){
        translate(width / 2, ginan);
        discovery();
        for (Stars s : stars) {
            s.display();
        }
    }

    void discovery(){
        for (int p = 0; p < s; p++){
            float _x = random(-imai, imai);
            float _y = random(-belt, acrux);
            Stars star;
            if (_y > 0) {
                star = new Stars(thigh(_x, _y), _y);
            } else {
                star = new Stars(_x, _y);
            }
            stars.add(star);
        }
    }

    float thigh(float _x, float _y){
        float intercept = random(-(g*imai), ginan);
        if (_x > 0){
            return (_y - intercept) / g;
        } else {
            return (intercept - _y) / g;
        }
    }
}