class Stars {
    float x, y;
    int id;
    ArrayList<Integer> links;

    Stars(float _x, float _y, int _p){
        x = _x;
        y = _y;
        id = _p;
        links = new ArrayList<Integer>();
    }

    void display(){
        stroke(random(255),random(255),random(255));
        strokeWeight(9);
        point(x,y);
    }

    void reg_links (int link_id){
        links.add(link_id);
    }
}