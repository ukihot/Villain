class Stars {
    float x, y;

    Stars(float _x, float _y){
        x = _x;
        y = _y;
    }

    void display(){
        stroke(random(255),random(255),random(255));
        strokeWeight(9);
        point(x,y);
    }
}