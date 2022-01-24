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
        imai = (W_SIZE / gold_rate) /2;
        acrux = imai * gold_rate;
        ginan = acrux - ((acrux - (acrux / gold_rate)) / gold_rate);
        belt = acrux - ginan;
        stars = new ArrayList<Stars>();
    }

    void main(){
        translate(width / 2, belt * 2);
        discovery();
        n_connect();
    }

    void discovery(){
        float interstellar_distance = imai /3.0;
        for (int p = 0; p < number_stars; p++){
            float _x = random(-imai, imai);
            float _y = random(-belt, acrux);
            Stars star;
            if (_y > 0) {
                star = new Stars(thigh_func(_x, _y), _y, p);
            } else {
                star = new Stars(_x, _y, p);
            }
            // 登録済みの星を振り返る
            reconsider(star);
            stars.add(star);
        }
    }

    float thigh_func(float _x, float _y){
        float intercept = random(-(gold_rate*imai), ginan);
        if (_x > 0){
            return (_y - intercept) / gold_rate;
        } else {
            return (intercept - _y) / gold_rate;
        }
    }

    //Neighborhood-connect
    void n_connect(){
        for (Stars _head : stars) {
            _head.display();
        }
    }

    // Random-connect
    // void r_connect(){
    //     int gon_max = 5;
    //     for (int j = 0; j < s-gon_max; j++){
    //         int gon = int(random(2, gon_max));
    //         fill(random(255),random(255),random(255), random(255));
    //         stroke(random(255),random(255),random(255), random(255));
    //         strokeWeight(map(noise(j),0,1,0,8));
    //         beginShape();
    //         curveVertex(stars.get(j).x, stars.get(j).y);
    //         curveVertex(stars.get(j).x, stars.get(j).y);
    //         for (int index = j+1; index <= j + gon; index++){
    //             curveVertex(stars.get(index).x, stars.get(index).y);
    //         }
    //         curveVertex(stars.get(j).x, stars.get(j).y);
    //         curveVertex(stars.get(j).x, stars.get(j).y);
    //         endShape();
    //         j += gon;
    //     }
    // }

    void reconsider(Stars _s){
        for (Stars _t : stars) {
            for (ArrayList<Stars> book : encyclopedia) {
                println(book.get(0).x, book.get(0).y, book.get(1).x, book.get(1).y);
                if (!isCross(_s, _t, book.get(0), book.get(1))){
                    println("HELLO?");
                    ArrayList<Stars> new_book = new ArrayList<Stars>();
                    new_book.add(_s);
                    new_book.add(_t);
                    encyclopedia.add(new_book);
                }
            }
        }
    }
}