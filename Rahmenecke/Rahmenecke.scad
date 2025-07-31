// Rahmenecke


Ecke = true;
Kante1 = true;
Kante2 = true;

xIn = 20;
yIn = 40;
zIn = 20;

xOut = xIn + 1;
yOut = yIn - 2;
zOut = zIn + 1;


module Ecke() {
    if (Kante1)Kante1();
    if (Kante2)Kante2();
}


module Kante1() {
    
    difference() {
        cube([xOut,yOut,zOut],center=true);
        cube([xIn,yIn,zIn],center=true);
    }
}

module Kante2() {
    
    rotate([0,0,90]) 
    translate([xOut/2-2,yOut/4-1,0])
    Kante1();
}

if (Ecke) Ecke();
    
