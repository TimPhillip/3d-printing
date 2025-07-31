// MQ-135 Gehäuse

use <../MQ2/MQ2.scad>

$fn = 60;
MQ2 = true;
gehaeusedeckel = true;
gehaeuseboden = true;

if (MQ2) translate([0,3,0]) MQ2();
    
if (gehaeusedeckel) gehaeusedeckel();
if (gehaeuseboden) gehaeuseboden();
    
module gehaeusedeckel() {
    translate([0,-2,5])
    difference() {
        cube([30,51,4], center=true);
        translate([0,10,0])
        cylinder(d=21,h=15, center=true);
        
        translate([-12,-20,0])
        cylinder(d=3,h=15, center=true);
        
        translate([12,-20,0])
        cylinder(d=3,h=15, center=true);
        
        translate([-12,20,0])
        cylinder(d=3,h=15, center=true);
        
        translate([12,20,0])
        cylinder(d=3,h=15, center=true);
    }
}
    

module gehaeuseboden() {
    translate([0,0,-3])
    difference() {
        translate([0,-2,0])
        cube([30,51,9],center=true);
        translate([0,-1,1])
        cube([21,46,8],center=true);

        translate([-12,-22,5])
        cylinder(d=2,h=10, center=true);
        
        translate([12,-22,5])
        cylinder(d=2,h=10, center=true);
        
        translate([-12,18,5])
        cylinder(d=2,h=10, center=true);
        
        translate([12,18,5])
        cylinder(d=2,h=10, center=true);
        



        
        translate([0,-17,-4])
        cylinder(d=8,h=5, center=true);



    }
}
