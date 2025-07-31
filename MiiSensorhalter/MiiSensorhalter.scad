// Halter Mii Temp + Hum Sensor

module innerFrame(){
    hull(){
        translate([21.5,21,0])
        cylinder(d=5,h=12,center=true);
        translate([-21.5,21,0])
        cylinder(d=5,h=12,center=true);
        translate([21.5,-21,0])
        cylinder(d=5,h=12,center=true);
        translate([-21.5,-21,0])
        cylinder(d=5,h=12,center=true);
    }
}

module Frame() {
    $fn=60;
    difference() {
        cube([60,60,11],center=true);
        innerFrame();
    }
    translate([0,0,5])
    cube([60,60,1],center=true);
}

module Halter() {
    translate([0,0,40])
    difference(){
        cube([60,50,20],center=true);
        translate([0,0,5])
        cube([70,43,15],center=true);
    }
}
rotate([90,0,0]) Frame();
//Halter();