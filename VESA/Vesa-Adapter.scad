// Tablet VESA 7.5 x 7.5 Adapter


module Mount() { 
    color("Purple")
    translate([-18,-3,0])
    import("Strong_wall-_and_tablet_mount_need_2.stl");
}

module Loch() {
    cylinder(d=4.3,h=40,center=true, $fn=60);
    translate([0,0,5])
    cylinder(d=6.3,h=5,center=true, $fn=60);
    
}
    
module Loecher() {
   translate([37.5,37.5,0])
   Loch(); 
   translate([37.5,-37.5,0])
   Loch(); 
   translate([-37.5,37.5,0])
   Loch(); 
   translate([-37.5,-37.5,0])
   Loch(); 
}

module Vesa() {
    difference() {
        translate([0,0,2.5])
        cube([90,90,5],center=true);
        Loecher();
    }
}

module Ring() {
    $fn=60;
    rotate([90,0,0])
    difference() {
        cylinder(d=25,h=12,center=true);
        cylinder(d=15,h=20,center=true);
    }
}

module Dreieck() {
    
    difference() {
        rotate([0,45,0])
        cube([35,12,35],center=true);
        translate([0,0,-20])
        cube([60,40,40],center=true);
    }
}

module Schelle() {
    difference() {
        Dreieck();
        translate([0,0,20])
        rotate([90,0,0])
        cylinder(d=25,h=12,center=true);
    }
    translate([0,0,20])
    Ring();
}

module Halter() {
    Mount();
    Vesa();
}

Vesa();

translate([0,-22,0])
Schelle();

translate([0,21,0])
Schelle();