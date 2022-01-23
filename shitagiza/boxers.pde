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
        translate(width / 2, belt * 2);
        discovery();
        connect();
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
        //for (Stars s : stars) {
        //    s.display();
        //}
    }

    float thigh(float _x, float _y){
        float intercept = random(-(g*imai), ginan);
        if (_x > 0){
            return (_y - intercept) / g;
        } else {
            return (intercept - _y) / g;
        }
    }

    //TODO: 隣接する星同士でコネクションしたい
    void connect(){
        int gon_max = 5;
        for (int j = 0; j < s-gon_max; j++){
            int gon = int(random(2, gon_max));

            fill(random(255),random(255),random(255), random(100));
            stroke(random(255),random(255),random(255), random(100));
            strokeWeight(map(noise(j),0,1,0,8));
            beginShape();
            curveVertex(stars.get(j).x, stars.get(j).y);
            curveVertex(stars.get(j).x, stars.get(j).y);
            for (int index = j+1; index < j + gon; index++){
                curveVertex(stars.get(index).x, stars.get(index).y);
            }
            curveVertex(stars.get(j+gon).x, stars.get(j+gon).y);
            curveVertex(stars.get(j+gon).x, stars.get(j+gon).y);
            endShape();

            j += gon;
        }
    }
}