// Spoolantrieb

spool_antrieb = true;
spool_achse = false;
spool = false;
achsteil = false;


use <spool.scad>

// Achsmaße
b=3.2;
l=5.0;
o=8;

module Achse28BY48() {
    union(){
        $fn=60;
        translate([-l/2+b/2,0,0])
        cylinder(h=o,r=b/2, center=true);
        cube([l/2,b,o], center=true);
        translate([l/2-b/2,0,0])
        cylinder(h=o,r=b/2, center=true);
    }
}

module spool_achsteil(toleranz=0) {
    b=8.2;
    l=3.2;
    o=55;
    translate([0,0,o/2])
    {
        cube([l+toleranz,b+toleranz,o],center=true);
        cube([l,b+3,o-7],center=true);
    }
}

module spool_achse(toleranz=0) {
    for (i=[1,-1]) {
        translate([8*i,0,0])
        spool_achsteil(toleranz);
    }        
    for (j=[1,-1]) {
        translate([0,8*j,0])
        rotate([0,0,90])
        spool_achsteil(toleranz);
    }
}

module magnetloch() {
    translate([8,12,0])
    cylinder(h=50,d=3.5, $fn=60, center=true);
}

module spool_antrieb() {
    difference() {
        flap_spool(10, 1.5, 5, 3, 3.2);
        Achse28BY48();
        spool_achse(0.2);
        magnetloch();
    }
}
module achsloch() {
    cylinder(h=50,d=3.5, $fn=60, center=true);
}

module spool() {
    translate([0,0,55-3.2])
    difference() {
        flap_spool(10, 1.5, 5, 3, 3.2);
        achsloch();
        spool_achse(0.2);
    } 
}

if (spool_antrieb) spool_antrieb();
if (spool_achse) spool_achse();
if (spool) spool();
if (achsteil) spool_achsteil();
