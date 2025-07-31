// TippKick Drehknopf

D = 15;
H = 20;
Loch = 6;

module Huelle() {
    cylinder(d=D, h=H,$fn=60,center=true);
}

module Schaft() {
    translate([0,0,-5])
    cylinder(d=Loch, h=H-2,$fn=12, center=true);
    translate([0,0,-H/2])
    cylinder(d=12, h=4,$fn=60, center=true);
}

module Stick() {
    translate([0,0,-1])
    cylinder(d=2,h=H-2, $fn= 10, center=true);
}

module Gripp(){
    for (i=[0:20:360]) {
        rotate([0,0,i])
        translate([D/2,0,0])
        Stick();
    }
}


module Ring() {  
    translate([0,0,H/2-2])
    union() {
        rotate_extrude(convexity = 10)
        translate([D/2-0.5,0,0])
        circle(2,$fn=60);
    }
}

module Knopf() {
    difference(){
        Huelle();
        Schaft();
    }
    
    Gripp();
    Ring();
}


Knopf();
//Ring();