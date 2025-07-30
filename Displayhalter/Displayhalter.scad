// Displayhalter

display = true;

if (display) {
rotate([-90,0,0]) translate([0,-2,0])
import("D:/Programme/OpenSCAD/Things/Display/2.4-Bezel.STL");
}
$fn=30;
ecken();

    translate([48,32,0])

difference() {
    cube([90,60,2],center=true);
    cube([86,56,3],center=true);
}
module ecken() {
    translate([4.5,4,0])
    halter();

    rotate([0,180,0])
    translate([-90.5,4,0])
    halter();

    rotate([0,180,-180])
    translate([4.5,-59,0])
    halter();

    rotate([0,0,-180])
    translate([-90.5,-59,0])
    halter();
}

module halter() {
    difference() {
        cube([12,12,2], center = true);
        translate([2.5,2.5,0])
        cylinder(d=3.5,h= 3, center= true);
    }
}