//////////////////////////////////////////////
// PC Standfuss
//////////////////////////////////////////////
$fn=30;

Fuss = true;
Befestigung = true;


if (Fuss) Fuss();

if (Befestigung) Befestigung();
    
module Fuss() {
    difference() {
        cylinder(d=30,h=15,center=true);
        translate([0,0,1])
        cylinder(d=26,h=15,center=true);
        translate([0,0,-1])
        cylinder(d=22,h=15,center=true);
    }
    
    difference() {
        union() {
            translate([0,0,-3.5])
            cube([1,29,8],center=true);
            translate([0,0,-3.5]) rotate([0,0,90])
            cube([1,29,8],center=true);
        }
       translate([0,0,-1])
       cylinder(d=6,h=15,center=true);
    }
    difference() {
        translate([0,0,-2.5])
        cylinder(d=10,h=10,center=true);
        translate([0,0,-1.5])
        cylinder(d=6,h=10,center=true);
    }
}

    
module Befestigung() {
    
    difference() {
        union() {
           translate([0,0,2])
           cylinder(d=6,h=14,center=true);
           translate([0,0,7.5])
           cylinder(d=15,h=3,center=true);
        }
        cylinder(d=2,h=30,center=true);
        translate([0,0,9])
        cylinder(d=5,h=5,center=true);
     }

}