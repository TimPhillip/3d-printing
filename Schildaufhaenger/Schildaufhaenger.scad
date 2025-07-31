// Schildaufhänger
//---------------------------------------

$fn=030;

difference() {
    cube([30,30,2]);
    translate([3,3,1.0])
    cube([30,30,2]);
    
    translate([16,16,-2])
    cylinder(r=2,h=7);
}
