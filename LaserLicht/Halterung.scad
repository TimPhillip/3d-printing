// Laserlicht
$fn=60;

module Ring() {
    difference() {
        cylinder(d=15,h=14,center=true);
        cylinder(d=12,h=16,center=true);
    }
}

module Stabil() {
    difference() {
        cylinder(d=18,h=3,center=true);
        cylinder(d=12,h=4,center=true);
    }
}

module Mount() {
    translate([0,8,0])
    cube([30,2,10], center=true);
    translate([0,9,-6])
    cube([30,4,2], center=true);
    translate([0,9,6])
    cube([30,4,2], center=true);
}

module Fuge() {
    translate([0,-6,0])
    cube([10,10,40],center=true);
}


module Halter() {
    difference() {
        union() {
            Ring();
            Stabil();
            Mount();
        }
     Fuge();
    }
}


module Halter2() {
    difference() {
        union() {
            Ring();
            Stabil();
            rotate([0,90,0])
            Mount();
        }
     Fuge();
    }
}

Halter2();