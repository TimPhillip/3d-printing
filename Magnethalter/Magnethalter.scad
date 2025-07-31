// Magnethalter

$fn=60;


module Halter() {
    difference(){
        Body();
        Schlitz();
    }
}


module Body() {
    difference() {
        cylinder(d=12,h=20,center=true);
        translate([0,0,4])
        cylinder(d=6.8,h=20,center=true);
        cylinder(d=4.5,h=25,center=true);
        
    }
}

module Schlitz() {
    translate([0,0,8.8])
    hull(){
        translate([10,0,0])
        cylinder(d=8.5,h=2,center=true);
        translate([-10,0,0])
        cylinder(d=8.5,h=1.8,center=true);
    }
}

Halter();