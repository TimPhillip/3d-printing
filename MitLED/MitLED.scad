// MitLED -Ikea

/* [Einzelteile] */

// Cover
Cover = true;
// Ground
Ground = true;

/* [Konfiguration] */

$fn=60;

// Wandstärke
Wand = 2.1 ; 

module Cover() {
    aussen=10.5+Wand;
    innen=10.5;
    difference() {
        cylinder(d=aussen,h=115, center=true);
        cylinder(d=aussen-Wand,h=120,center=true);
        translate([0,-10,0])
        cube([20,20,120],center=true);
    }

    translate([-aussen/2+1,-0.5,0])
    cube([2,1.25,115],center=true);
    translate([aussen/2-1,-0.5,0])
    cube([2,1.25,115],center=true);
}


module Ground() {

    translate([0,-0.5,0])
    cube([8,1.25,115],center=true);
    
    translate([-3.5,0.5,0])
    rotate([0,0,-50])
    cube([3.25,1.25,115],center=true);
    
    translate([3.5,0.5,0])
    rotate([0,0,50])
    cube([3.25,1.25,115],center=true);
}


if (Cover)Cover();

if (Ground) Ground();