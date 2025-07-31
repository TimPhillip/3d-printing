// Tipp Kick Netz

Wabe = 15;
Faden = 0.5;
Dick = 4;
Level = 1;

module base()   {

    difference() {
        cube([Wabe,Wabe,Dick]);
        translate([Faden,0,0])
        cube([Wabe-2*Faden,Wabe,Dick-Level]);
        translate([0,Faden,Level])
        cube([Wabe,Wabe-2*Faden,Dick-Level]);
    }
}

module roundedBase() {
    minkowski() {
        base();
        sphere(0.5);
    }
}

for (i=[0:Wabe+8*Faden:160]){ 
    for (j=[0:Wabe+8*Faden:80]){ 
        translate([i,j,0])
        roundedBase();
        translate([i+Wabe/2,j+Wabe/2,0])
        roundedBase();
    }
}