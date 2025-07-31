// Leuchterkappe

$fn =50;

module Boje(){

    hull() {
        
        translate([0,0,20]) sphere(d=10);
        translate([0,0,10]) sphere(d=15);
        translate([0,0,0]) sphere(d=10);
    }
}


module Kappe () {
    
    difference() {
        Boje()
        translate([0,0,1]) scale([0.8,0.8,0.8]) Boje();
        translate([0,0,5]) cylinder(d=8.0,h=20);
        translate([0,0,32]) cube([20,20,20],true);
    }
    
    translate([0,0,19])
    difference() {
        cylinder(d=12,h=3);
        cylinder(d=8,h=5);
    }
}

Kappe();