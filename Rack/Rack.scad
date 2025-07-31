// Rack
//
// 1 HE = 1,75 Zoll
// mit 3 Löchern
//
// Lochabstand: 
// 1 - 0,625 Zoll
// 2 - 0,625 Zoll
// 3 - 0,500 Zoll
// --------------
// =   1,750 Zoll



// -
// *    Loch
// -            0,625
// *    Loch
// -            0,625
// *    Loch
// -            0,5


// 1 Zoll = 25,4 mm


// /////////////////////////////////////////////////

HE1 = false;
HE2 = false;
HE3 = false;
HE4 = false;
Eck = true;
Kante = false;

HE1Tray = false;

HE1Display = false;

// ////////////////////////////////////////////////

Zoll = 25.4;
Breit= 0.85*Zoll;

module Loch(){
    $fn=50;
    //cylinder(d=6,h=5,center=true);
    cube([9.33,9.33,5],true);
}

module HE1() {
    HE1Eck();
    difference(){
        cube([Breit,1.75*Zoll,2]);
        translate([Breit/2,0.25*Zoll,2])Loch();
        translate([Breit/2,(0.25+0.625)*Zoll,2])Loch();
        translate([Breit/2,(0.25+0.625+0.625)*Zoll,2])Loch();
    }
}

module HE1Eck(){
    if (Eck) {
        rotate([0,-90,0]){
            difference(){
                cube([Breit,1.75*Zoll,2]);
                translate([Breit/2,0.25*Zoll,2])Loch();
                translate([Breit/2,(0.25+0.625)*Zoll,2])Loch();
                translate([Breit/2,(0.25+0.625+0.625)*Zoll,2])Loch();
            }           
        }
    }
}

module HEx(x) {
    for (i=[0:x-1])
        translate([0,(i*1.75)*Zoll,0]) HE1();
}

module HE1Tray() {
    intersection() {
        translate([00,-5,0])import("Etagere_Rack_10.stl");
        translate([25,00,0]) rotate([0,0,-45])  cube([190,190,50]);
    }
}

module HE1Display() {
    difference() {
        cube([254,1.75*Zoll,3]);
        
        for (i=[0:4]){
            translate([i*45,0,0])Display128x32();
            Schlitz();
            translate([0,32,0])Schlitz();
            translate([237,0,0])Schlitz();
            translate([237,32,0])Schlitz();
        }
    }
    for (i=[0:4]){
        translate([i*45,0,0])DisplayLoch();
    }
}


module Display128x32(){
    $fn=40;
    translate([21,15,-2]) cube([26.2,15,10]);
    translate([19.75,6,+1.0]) cube([29.5,28.5,10]);

}

module Schlitz(){
    translate([7,6,2])
    hull(){
        cylinder(d=6.5, h=5, center=true);
        translate([3,0,0])
        cylinder(d=6.5, h=5, center=true);
    }
}

module Halteloch() {
//    $fn=40;
    translate([0,0,-2])
    difference() {
        translate([0,0,0])
        cylinder(d=4,h=2,true);
        translate([0,0,0.25])
        cylinder(d=1.5,h=4,true);
    }
}

module DisplayLoch() {
        translate([22,8,3.0])Halteloch();
        translate([22,32.5,3.0])Halteloch();
        translate([47,8,3.0])Halteloch();
        translate([47,32.5,3.0])Halteloch();
}

module Kante(){
    cube([1.75*Breit,1.75*Zoll,Breit+2]); 
}
module Kantex(x) {
    translate([30,-2.5,-3])
    difference()
    {
        union()
        {
            for (i=[0:x-1])
                translate([0,(i*1.75)*Zoll,0]) Kante();
            translate([0,-5,0]) cube([1.75*Breit,9.5,Breit+2]);
            translate([0,x*1.75*Zoll,0]) cube([1.75*Breit,9.5,Breit+2]);
        }
        translate([3,-3,2])
        cube([2*Breit,188,Breit+2]);
        
        rotate([90,0,0])
        translate([13,13,3])
        Loch();

        rotate([90,0,0])
        translate([13+0.625*Zoll,13,3])
        Loch();
        
        rotate([90,0,0])
        translate([13,13,-185])
        Loch();
        
        rotate([90,0,0])
        translate([13+0.625*Zoll,13,-185])
        Loch();
    }
}


if (HE1) HE1();
if (HE2) translate([1*25,0,0])HEx(2);
if (HE3) translate([2*25,0,0])HEx(3);
if (HE4) translate([3*25,0,0])HEx(4);

if (HE1Tray) HE1Tray();
    
if (HE1Display) 
//    difference() {
        HE1Display();
//        translate([0,0,-5])
//        cube ([190,100,50]);
//    }

if (Kante) Kantex(4);