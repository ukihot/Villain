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

    Boxers(float x, float y, float z){
        miz = new PVector(x, y, z);
        dub = new PVector(miz.x + g_rate(W_SIZE), miz.y, miz.z);
        ben = new PVector(miz.x, miz.y + (W_SIZE - g_rate(W_SIZE)),miz.z);
        mer = new PVector(dub.x, ben.y, miz.z);
        meg = new PVector(dub.x / 2, g_rate(ben.y), miz.z);
        ali = new PVector(meg.x - g_rate(ben.y - meg.y), ben.y,miz.z);
        phe = new PVector(meg.x + g_rate(ben.y - meg.y), ali.y, miz.z);
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

    void pattern_chaos(){
        miz.add(chaos(miz));
        dub.add(chaos(dub));
        ben.add(chaos(ben));
        mer.add(chaos(mer));
        meg.add(chaos(meg));
        ali.add(chaos(ali));
        phe.add(chaos(phe));
    }

    
}