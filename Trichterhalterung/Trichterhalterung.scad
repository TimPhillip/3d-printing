// Trichterhalterung

$fn = 30;

gabel = true;
halter = false;
if (gabel) gabel();
if (halter) halter();

module gabel() {
    difference() {
        difference(){
            cylinder(r=40,h=5, center=true);
            cylinder(r=32,h=6, center=true);
            
            // LED Lights
            translate([0,36,0])
            cylinder(d=3,h=6, center=true);
            rotate([0,0,-45]) translate([0,36,0]) 
            cylinder(d=3,h=6, center=true);
            rotate([0,0,-90]) translate([0,36,0]) 
            cylinder(d=3,h=6, center=true);
            rotate([0,0,-135]) translate([0,36,0]) 
            cylinder(d=3,h=6, center=true);
            rotate([0,0,-180]) translate([0,36,0]) 
            cylinder(d=3,h=6, center=true);
        }
        translate([-30,0,0])
        cube([60,100,10], center=true);
    }
    // Henkel
    translate([66,0,0])
    cube([56,10,5], center=true);
}


module halter() {
    union() {
        gabel();
        rotate([0,180,0]) gabel();
    }
}