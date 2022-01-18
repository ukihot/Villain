class Boxers extends Underwear{
    //                [Big Dipper]
    //         Mizar  ._________. Dubhe
    //               /     |     \
    //              /      .Megrez\
    // Benetonasch ._____./ \._____.
    //                Alioth  Phecda Merak
    //
    PVector miz = new PVector(0, 0);
    PVector dub = new PVector(miz.x + g_rate(W_SIZE), miz.y);
    PVector ben = new PVector(miz.x, miz.y + (W_SIZE - g_rate(W_SIZE)));
    PVector mer = new PVector(dub.x, ben.y);
    PVector meg = new PVector(dub.x / 2, g_rate(ben.y));
    PVector ali = new PVector(meg.x - g_rate(ben.y - meg.y), ben.y);
    PVector phe = new PVector(meg.x + g_rate(ben.y - meg.y), ali.y);

    Boxers(){
    }

    @Override
    void manifestation(){
        translate((W_SIZE-dub.x)/2, (W_SIZE-ben.y)/2);
        // Waist of boxer shorts.
        v_line(miz, dub);
        v_line(miz, ben);
        v_line(ben, ali);
        v_line(ali, meg);
        v_line(meg, phe);
        v_line(phe, mer);
        v_line(mer, dub);

        // TODO: Lower line of the right foot.
    }
}