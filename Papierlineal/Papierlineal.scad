// Papierschneidelineal

Lineal();


module Lineal() {
    difference() {
        union() {
        
            cube([120,30,12]);
            cube([30,200,12]);
        }
        translate([-2.5,6,-1])
        cube([125,18,10]);
        translate([70,7,5])
        rotate([90,0,0])
        cylinder(d=5,h=8);
    }
}
