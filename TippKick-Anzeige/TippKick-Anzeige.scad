// TippKick-Anzeige

use <ISOThread.scad>;


Kopf = true;
Separation = true;
Uhrseparation= false;
Stand = false;
Base = false;
Front = true;
Uhrfront = false;
OLED = false;
Deckel = false;

Schnitt = false;

module SSD1306_Screen(w) {
    sdx = 14.7;
    sdy = 26.7;
    sdz = w;
    
    color ("Black")
    cube([sdx,sdy,sdz],center=true);
}

module OLED() {
    sdx = 28.0;
    sdy = 27.5;
    sdz = 1.5;
    
    color ("Darkgreen")
    translate([-2.5,0,1.5])
    difference() {
        cube([sdx,sdy,sdz],center=true);
        OLEDHalterung();
    }
    SSD1306_Screen(3);
}

module Stift() {
    difference() {
        translate([0,0,-0.5])
//        cylinder(d=3,h=1.5,$fn=60,center=true);
        cylinder(d=2,h=5.5,$fn=60,center=true);
    }
}


module Stand() {
    hh = 40;
    rotate([90,0,0])
    translate([0,0,hh/2+28])
    difference() {
        union() {
            cylinder(d=20,h=hh,center=true);
            translate([0,0,0])
            Hohlgewinde();
            translate([0,0,-0])
            rotate([180,0,0])
            Hohlgewinde();
        }
        cylinder(d=14,h=hh+50,center=true);
    }
}

module Kopf() {
    ax = 50;
    difference() {
        minkowski() {
            cube([ax,ax,40],center=true);
            sphere(r=3,$fn=60);
        }
        cube([ax-3,ax-3,50],center=true);

        // Stand Loch
        rotate([90,0,0])
        translate([0,0,50])
        cylinder(d=18,h=120,$fn=60,center=true);

        // Encoder Loch
        rotate([90,0,0])
        translate([0,0,-50])
        cylinder(d=7.5,h=120,$fn=60,center=true);
        
        // Encoder Vertiefung
        translate([0,16,0])
        cube([20,20,20],center=true);
        
        // Deckelkappung
        translate([0,0,22])
        cube([56,56,2],center=true);
        
        translate([0,0,22])
        DeckelHalterung();
    }  
}

module Deckel(){
    translate([0,0,22])
    difference() {
        minkowski() {
            cube([50.5,50.5,1.5],center=true);
            cylinder(d=5,$fn=60);
        }
        DeckelHalterung();
    }
}
module Separation() {
    ax = 50;
    // inner separation
    translate([0,0,-17])
    difference() {
        translate([0,0,0])
        cube([ax,ax,4],center=true);
        
        if (Uhrseparation) rotate([0,0,90])
        cube([ax-35,ax-15,50],center=true);
        else
        cube([ax-35,ax-15,50],center=true);

        if (Uhrseparation) rotate([0,0,-90])
        translate([10,0,0])
        cube([8,15,30],center=true);
        else
        translate([10,0,0])
        cube([8,15,30],center=true);
        
        translate([-1.25,0,-2])
        OLEDHalterung();
        translate([0,0,0])
        mount();
    } 
}


module Base() {
    translate([0,-90,0])
    minkowski() {
        union() {
            difference() {
                cube([80,20,40],center=true);
                translate([0,-5,0])
                cube([75,20,35],center=true);
                rotate([90,0,0])
                translate([0,0,0])
                cylinder(d=20,h=120,center=true);
            }
        }
        sphere(r=3,$fn=60);
    }
}


module Turm () {
    if (Kopf) Kopf();
    if (Stand) Stand();
//    if (Base) Base();
    if (Separation) Separation();
    if (Front)translate([0,0,-22]) Front();
    if (OLED) translate([0,0,-22]) OLED();
    if (Deckel)     Deckel();
}   

module Front() {
    b = 46.5;
    h = 46.5;
    translate([0,0,1])
    difference(){
        cube([b,h,4],center=true);
        if (Uhrfront) {
            rotate([0,0,90])
            translate([0,0,1])
            cube([b-8,h-8,3],center=true);
            rotate([0,0,90])
            translate([2.5,1.5,0])
            SSD1306_Screen(50);
            rotate([0,0,90])
            translate([0,0,4])
            mount();
        }
        else {
            translate([-0,0,1])
            cube([b-8,h-8,3],center=true);
            translate([1.5,0,0])
            SSD1306_Screen(50);
            translate([0,0,4])
            mount();
        }
    }
}

module OLEDHalterung() {
    union() {
        a= 24/2;
        b= 23.5/2;
        translate([a,b,0.5])
        Stift();
        translate([-a,b,0.5])
        Stift();
        translate([a,-b,0.5])
        Stift();
        translate([-a,-b,0.5])
        Stift();
    }
}

module mount() {
    union() {
        a= 42/2;
        b= 42/2;
        translate([a,b,0.5])
        Stift();
        translate([-a,b,0.5])
        Stift();
        translate([a,-b,0.5])
        Stift();
        translate([-a,-b,0.5])
        Stift();
    }
}    

module DeckelHalterung() {
    union() {
        a= 50/2;
        b= 50/2;
        translate([a,b,0.5])
        Stift();
        translate([-a,b,0.5])
        Stift();
        translate([a,-b,0.5])
        Stift();
        translate([-a,-b,0.5])
        Stift();
    }
}    

module Hohlgewinde() {
    difference(){
        hex_bolt(20,10);
        translate([0,0,-8])
        cube([50,50,50],center=true);
    }
}

// ====================

difference() {

    translate([0,0,22])
    Turm();
    
    if (Schnitt) 
    translate([0,-150,-30])    
    cube([200,200,100]);
    }


