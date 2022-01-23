class Boxers extends Underwear{
    //                [Big Dipper]
    //         Mizar  ._________. Dubhe
    //               /     |     \
    //              /      .Megrez\
    // Benetonasch ._____./ \._____.
    //                Alioth  Phecda Merak
    //
    PVector miz;
    PVector dub;
    PVector ben;
    PVector mer;
    PVector meg;
    PVector ali;
    PVector phe;

    Boxers(float x, float y){
        miz = new PVector(x, y);
        dub = new PVector(miz.x + g_rate(W_SIZE), miz.y);
        ben = new PVector(miz.x, miz.y + (W_SIZE - g_rate(W_SIZE)));
        mer = new PVector(dub.x, ben.y);
        meg = new PVector(dub.x / 2, g_rate(ben.y));
        ali = new PVector(meg.x - g_rate(ben.y - meg.y), ben.y);
        phe = new PVector(meg.x + g_rate(ben.y - meg.y), ali.y);
    }

    void main(){
        translate((W_SIZE-dub.x)/2, (W_SIZE-ben.y)/2);
        v_line(miz, dub);
        v_line(miz, ben);
        v_line(ben, ali);
        v_line(ali, meg);
        v_line(meg, phe);
        v_line(phe, mer);
        v_line(mer, dub);
        text(frameCount, 100, height/2);
    }
}