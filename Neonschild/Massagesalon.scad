// Neonschild

Schild = true;
Sockel  = false;

module Outline ()
{
    translate([12.5,0,0])
    linear_extrude(8)
    text("Massage-Salon",size=10, font="Bauhaus 93");
    translate([-1,-4.5,-8])
    cube ([115,16,12]);
}

module Led() {
    cylinder(d=5.5,h=20.0, center=true,$fn=30);
}


module Loecher() {
    translate ([5,4,-0.4])
    union(){
        translate ([10,0,0])
        Led();
        translate ([30,0,0])
        Led();
        translate ([50,0,0])
        Led();
        translate ([70,0,0])
        Led();
    }
}

module Sockel() {
    translate([-1,-4.5,0])
    difference() {
        cube ([90,16,3]);
        translate([0,4.5,0])
        Loecher();
    }
}

module Schild() {
    difference() {
        Outline();
        translate([0,0,4])
        LedLoch();
        translate([117,0,0])
        rotate([0,90,0])
        LedLoch();
        translate([50,3,0])
        rotate([0,90,0])
        cylinder(d=6.5,h=200.0, center=true,$fn=30);
    }
}


module LedLoch() {
    translate([8,3,-4.5])
    rotate([0,90,0])
    Led();
    translate([0,3,-12])
    Led();
}

if (Schild) Schild();

if (Sockel) translate([0,0,-5]) Sockel();