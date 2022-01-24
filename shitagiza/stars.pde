class Stars {
    float x, y;
    int id;

    Stars(float _x, float _y, int _p){
        x = _x;
        y = _y;
        id = _p;
    }

    void display(){
        stroke(random(255),random(255),random(255));
        strokeWeight(9);
        point(x,y);
    }

}