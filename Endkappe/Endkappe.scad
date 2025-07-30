// Endkappe

$fn=30;


difference() {
    cylinder(d=5,h=7, center=true);
    translate([0,0,2])
    cylinder(d=1,h=5, center=true);
}