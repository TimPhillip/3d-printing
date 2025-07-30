// Crimper-Halterung


module Loch() {
    $fn=60;
    translate([0,0,-5])
    cylinder(d=4,h=20);
    translate([0,0,5])
    cylinder(d=8,h=3.5);
}

module Dupont(){
    translate([-20,-47,0])
    linear_extrude(height = 25) {
            scale(0.139)
            import("Crimper-Dupont.dxf");
    } 
}

module Dupontleft() {
    difference() {
        Dupont();
        translate([20,-5,-50])
        cube([100,100,100]);
    }
}

module Dupontmiddle() {
    difference() {
        Dupont();
        translate([-80,-5,-50])
        cube([100,100,100]);
        translate([50,-5,-50])
        cube([100,100,100]);
    }
}

module Dupontright() {
    difference() {
        Dupont();
        translate([-50,-5,-50])
        cube([100,100,100]);
    }
}



Dupontleft();
translate([9,0,0])
Dupontmiddle();
translate([18,0,0])
Dupontright();


difference() {
    cube([96,50,8]);
    translate([30,30,0])
    Loch();
    translate([96-30,30,0])
    Loch();
}

