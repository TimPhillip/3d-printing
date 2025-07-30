// Bohrerstand

Boden = true;
Sign = true;

module sign() {
    ss= 8.5;
    vv = 6;
    translate([vv,8.5,ss])
    Schrift("1.0");

    
    translate([vv,18.5,ss])
    Schrift("1.5");

    
    translate([vv,28.5,ss])
    Schrift("2.0");

    
    translate([vv,38.5,ss])
    Schrift("2.5");

    
    translate([vv,48.5,ss])
    Schrift("3.0");
}

module Boden() {
    
    cube([110,60,10],center=false);

}

module Loch(dd) {
    cylinder(d=dd,h=60, $fn=60, center=false);
}

module Schrift(Text) {
    linear_extrude(2)
    text(Text,size=5, halign="center");
}


if (Boden) {
    difference() { 
        Boden();
        hh=15;
        ff=0.6;
        for (i=[0:10:90]){
            translate([i+hh,10,3])
            Loch(1.0+ff);
        }

        for (i=[0:10:90]){
            translate([i+hh,20,3])
            Loch(1.5+ff);
        }
        for (i=[0:10:90]){
            translate([i+hh,30,3])
            Loch(2.0+ff);
        }
        for (i=[0:10:90]){
            translate([i+hh,40,3])
            Loch(2.5+ff);
        }
        for (i=[0:10:90]){
            translate([i+hh,50,3])
            Loch(3.0+ff);
        }
//        sign();
    }
}

if (Sign) sign();