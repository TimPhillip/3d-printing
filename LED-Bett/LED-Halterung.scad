// LED Halterung

$fn=50;

gebogen = true;
gerade= false;
Halter=true;

Radius = 40;
Width = 20;
InnerWidth = 15;

wLED = 16.5;

module Loch() {
    union() {
        cylinder(d=4, h=20, center=true);
        translate([0,0,6])cylinder(d=8, h=5, center=true);
    }
}

module Viertelkreis(R,W) {
    difference() {
        cylinder(d=R*2,h=W,center=true);
        translate([-R,0,-W/2-3]) cube([R*2+3,R+3,W+5]);
        translate([-R-3,-R-2,-W/2-2]) cube([R+3,R+3,W+5]);
        
    }
    
//    intersection() {
//        cylinder(d=R*2,h=W,center=true);
//        translate([0,-Radius,-Width/2])cube([R,R,W+2]);        
//    }
    
}

module hohlerViertelkreis(R,W,IW) {
    difference() {
        Viertelkreis(R,W);
        translate([R/2+6,-R/2-6,0]) cube([R,R,IW],center=true);        
    }
}

module Halter() {
  
  rotate([0,-180,-90])
  translate([0,0,0])
  difference() {
    Viertelkreis(22,Width); 
    translate([2.5,-2.5,0]) Viertelkreis(wLED,Width+3);
  } 

}

module LEDHalterung() {
    difference() {
        hohlerViertelkreis(Radius, Width, InnerWidth);
        translate([0,0,0])cylinder(d=Radius*2-25,h=50,center=true);
        rotate([90,0,0])
        translate([Radius-6,0,0])
        Loch();
    }
}

module LEDHalterGerade() {
    translate([Radius/2,-Width/2,0])
    difference(){
        cube([Radius,Width,Width],center=true);
        translate([0,-2.5,0]) cube([Radius-5,Width,InnerWidth],center=true);
        rotate([-90,0,0])
        translate([Radius/2-10,0,0.5])
        Loch();
        rotate([-90,0,0])
        translate([Radius/2-50,0,0.5])
        Loch();
    }
    translate([Width/4,-Radius/2,0]) cube([Width/2,Radius,Width],center=true);
}



if (gebogen) LEDHalterung();
if (gerade) LEDHalterGerade();
if (Halter) translate([0,-Radius,0])Halter();