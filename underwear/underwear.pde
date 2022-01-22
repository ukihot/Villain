//
// All comments are translations by DeepL.
//
// To use it as an icon for Twitter, make the size 400x400.
final int W_SIZE = 800;
Boxers boxers;
Shorts shorts;

void settings(){
    size(W_SIZE,W_SIZE, P3D);
}

void setup(){
    textFont(createFont("Meiryo", 50));
    boxers = new Boxers(1,1,1);
    shorts = new Shorts();
}

void draw(){
    fill(#ffffff);
    stroke(#ffffff);
    background( #000000 );
    rotateX((float)-mouseY/100);
    rotateY((float)-mouseX/100);
    boxers.main();

    //if (frameCount > 2000) exit();
}

class Underwear{
    Underwear(){
    }

    float g_rate(float a){
        return a/((1+sqrt(5))/2);
    }

    void v_line(PVector _en, PVector _ti){
        line(_en.x, _en.y, _ti.x, _ti.y);
    }

    // Meteorologist Edward Lorenz simplified the equations of fluid dynamics to describe the flow of the atmosphere under special circumstances.
    // Underwear is chaos.
    // TODO: fix
    PVector chaos(PVector target){
        float p = 10;
        float r = 28;
        float b = 8.0 / 3.0;
        float dt = 0.001;
        float dx = p*(target.y-target.x);
        float dy = target.x*(r-target.z)-target.y;
        float dz = target.x*target.y-b*target.z;
        PVector d = new PVector(dx*dt, dy*dt, dz*dt);
        return d.setMag(0.1);
    }
}