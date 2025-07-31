// Marley Dachrinne

muster = true;
halter = true;
rinne = true;

module Muster() {
    color("Gray")
    translate([78,50,-5])
    rotate([0,0,13])
    import("Haken-Rinne_7.stl", convexity=3);
}



module Rinne() {
    color("brown")
    union() {
    $fn = 90;
    difference() {
        cylinder(d=82,h=15,center=true);
        cylinder(d=78,h=17,center=true);
        translate([0,30,0])
        cube([100,60,30],center=true);
    }
    
    translate([40,10,0])
    cube([2,20,15],center=true);
    
    translate([-40,10,0])
    cube([2,20,15],center=true);
    }
}


module Winkel() {
    difference() {
        cube([104,104,35],center=true);
        cube([96,96,37],center=true);
        translate([0,70,0])
        cube([110,60,40],center=true);
        translate([55,60,0])
        cube([110,80,40],center=true);
    }
}

module Nase() {
    translate([49.5,20,0])
    cube([15,4,35], center=true);
}

module Abschluss() {
    translate([-47,40,0])
    cube([10,4,35], center=true);
}

module Schlitz() {
    cube([20,40,5],center=true);
}

module Halter() {
    $fn = 90;
    difference() {
        union() {
            cylinder(d=104,h=15,center=true);
            cylinder(d=90,h=35,center=true);
        }
        cylinder(d=84,h=37,center=true);
        translate([5,30,0])
        cube([106,60,40],center=true);
    }
    translate([47,10,0])
    cube([10,20,15],center=true);
    
    translate([-43.5,20,0])
    cube([3,40,35],center=true);
    
    translate([43.5,10,0])
    cube([3,20,35],center=true);
    
    translate([-47,20,0])
    cube([10,40,15],center=true);
    
    Winkel();
    Nase();
    Abschluss();
}

if (muster) Muster();
if (halter) {
        difference() {
            Halter();
            translate([-46,10,10])
            Schlitz();
            translate([-46,10,-10])
            Schlitz();
        }
}
if (rinne) Rinne();