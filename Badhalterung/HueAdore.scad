// Hue Badlampenhalter

$fn =50;

module El() {

    cube ([138,20,55],center=true);

    translate([0,-55/2+10,-55/2])
    cube ([138,55,20],center=true);
}

module Loch() {
    
    rotate([90,0,0])
    translate([0,0,-20])
    cylinder(d=6,h=40);
//    rotate([90,0,0])
//    translate([0,0,-20])
//    cylinder(d=12,h=4);
}

module DoppelLoch() {
    
    rotate([90,0,0])
    translate([0,0,-90])
    cylinder(d=6,h=70);
    rotate([90,0,0])
    translate([0,0,-20])
    cylinder(d=12,h=4);
}

module Halter() {
    
    
    difference() {  
        El();
        rotate([90,0,0])
        translate([0,0,-20])
        cylinder(d=33,h=50);
        translate([55,-9.5,15])
        Loch();
        translate([-55,-9.5,-25])
        Loch();
        
        rotate([-90,0,0])
        translate([0,0,-35])
        DoppelLoch();
        
        rotate([-90,0,0])
        translate([60,0,-35])
        DoppelLoch();
        
        rotate([-90,0,0])
        translate([-60,0,-35])
        DoppelLoch();
    }
}


Halter();

