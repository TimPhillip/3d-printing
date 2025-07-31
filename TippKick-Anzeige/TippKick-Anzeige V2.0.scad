// TippKick-Anzeige V2.0

use <ISOThread.scad>;

/* [Parts] */
Kopf = true;                                        // Anzeigekopf
Separation = true;                                  // Sepatation in Kopf
Stand = true;                                       // Standrohr mit Kabelführung
Base = true;                                        // Box zur Aufnahme von Elektik
Front = true;                                       // Frontblende für Display
Deckel = false;                                     // hinterer Deckel des Kopfes
Boden = false;                                      // Boden für Base

/* [Helper] */
Uhrfront = false;                                   // true=Uhr/Menu false=Score
Turm3=false;                                        // alle 3 Türme zeigen
OLED = false;                                       // Display SSD1306
Platine=false;                                      // Grundplatine
Ladeplatine = false;                                // Ladeplatine
Batterie = false;                                   // Batterie
Schnitt = false;                                    // Testschnitt durch alles



module SchalterLoch() {
    cube([20,12.5,8], center=true);
    translate([0,0,12])
    cube([26,14.5,16], center=true);
}

module USBLoch() {
    cube([13,10,18], center=true);
}

module Stuetze(){
    rotate([90,0,0])
    difference() {
        cube([10,10,30],center=true);
        translate([0,0,10])
        Bohr(2,11,0,0);
 //       translate([4,4,13])
 //       cylinder(d=8,h=5,center=true);
    }
}

module Bodenstuetzen(px,py) {
    k=0;
    for (x=[1,-1])
        for (y=[1,-1])
        {
            translate([x*px,0,y*py])
//            rotate([0,y*90,0])
            Stuetze();
        }
}

module Schraub(di,ho,px,py) {
    rotate([90,0,0])
    difference(){
        translate([px,py,0])
        cylinder(d=di+3, h=ho, center=true,$fn=60);
        Bohr(di,ho+2,px,py);
    }
}

module Bohr(di,ho,px,py) {
    translate([px,py,0])
    cylinder(d=di, h=ho, center=true,$fn=60);
}

module Batterie() {
    color("Gold")
    cube([34,10,50],center=true);
}

module Platine() {
    difference() {
        color("Green")
        cube([97,25,89],center=true);
        Platinenloch(3,30,44.5/2,74/2);
        Platinenloch(2,30,78.5/2,77.5/2);
    }
}

module Ladeplatine() {
    difference() {
        color("Brown")
        cube([26,20,66],center=true);
        Platinenloch(3,30,20/2,60/2);
        Platinenloch(2,30,10/2,30/2);
    }
}

module Platinenhalterung(di,ho,px,py) {
    for (x=[1,-1])
        for (y=[1,-1])
        {
            Schraub(di,ho,x*px,y*py);
        }
}

module Platinenloch(di,ho,px,py) {
    for (x=[1,-1])
        for (y=[1,-1])
        {
            rotate([90,0,0])
            Bohr(di,ho,x*px,y*py);
        }
}

module SSD1306_Screen(w,d=0) {
    sdx = 14.7;
    sdy = 26.7-d;
    sdz = w;
    
    color ("Black")
    cube([sdx,sdy,sdz],center=true);
}

module OLED() {
    sdx = 28.0;
    sdy = 27.5;
    sdz = 1.5;
    
    if (Uhrfront) {
        rotate([0,0,90]) 
        union() {    
            color ("Darkgreen")
            translate([0,-1,1.5])
            difference() {
                cube([sdx,sdy,sdz],center=true);
                OLEDHalterung();
            }
            translate([0,-1.5,0])
            SSD1306_Screen(1);
        }
    }
    else {
        union() {    
            color ("Darkgreen")
            translate([0,-1,1.5])
            difference() {
                cube([sdx,sdy,sdz],center=true);
                OLEDHalterung();
            }
            translate([0,-1.5,0])
            SSD1306_Screen(1);
        }
    }
}

module Stift() {
    translate([0,0,-0.5])
    cylinder(d=2,h=5.5,center=true,$fn=60);
}

module Stand() {
    hh = 40;
    rotate([90,0,0])
    translate([0,0,hh/2+28])
    difference() {
        union() {
            cylinder(d=20,h=hh,center=true);
            translate([0,0,2])
            Hohlgewinde();                             // Gewinde zur Montage an Box

            translate([0,0,-20])
            cylinder(d=17.5,h=8,center=true);          // Zapfen Anschluss für Kopf
        }
        cylinder(d=14,h=hh+50,center=true);            // Loch für Kabel
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
    translate([0,0,-15.5])
    difference() {
        translate([0,0,0])
        cube([ax,ax,4],center=true);
        
        cube([15,34,50],center=true);

        translate([-10,0,0])
        cube([10,15,30],center=true);
        translate([10,0,0])
        cube([10,15,30],center=true);
        
        translate([1.5,-0.5,-2])
        OLEDHalterung();
        translate([0,0,0])
        mount();
    } 
}

module Base(){
    
        translate([0,-90,0])
        difference() {
            union() {
                minkowski() {
                    Base_pur();
                    sphere(r=2);
                } 
            }
            for (i=[-1,0,1]) {
                rotate([90,0,0])
                translate([i*60,0,0])
                cylinder(d=25,h=120,center=true);       // Loch
            }
            rotate([0,180,0])
            translate([-60,0,-54])
            SchalterLoch();                             // Schalteranschluss
            
            translate([31,0,54])                        // Ladeanschluss
            USBLoch();

            translate([11,0,54])                        // Programmieranschluss
            USBLoch();
        }
        
        translate([0,-90,0])
        difference() {
            union() {
                for (i=[-1,0,1]) {
                    rotate([90,0,0])
                    translate([i*60,0,-18])
                    hex_nut(20);                        // Gewinde
                }
            }
            translate([0,-17,0])
            cube([200,60,50],center=true);
        }
        
        translate([0,-90,0])
        Bodenstuetzen(166/2,86/2);

}

module Boden(){
    difference() {
        union() {
            minkowski() {
                Boden_pur();
                sphere(r=2);
            }
            
            translate([-33,-104,0])
            union(){                                          // Grundplatine
                Platinenhalterung(2,3,44.5/2,74/2);
                Platinenhalterung(1,3,78.5/2,77.5/2);
            }
            translate([33,-104,13])
            union(){                                          // Ladeplatine
                Platinenhalterung(2,3,20/2,60/2);
                Platinenhalterung(1,3,10/2,30/2);
            }
            translate([66,-99,22])
            Batteriehalterung();

        }

        translate([0,-86,0])
        for (px=[1,-1])
            for (py=[1,-1])
                rotate([90,0,0])
                translate([0,0,22])
                {
                    Bohr(2,10,px*166/2,py*86/2);
                    translate([0,0,1])
                    Bohr(4,4,px*166/2,py*86/2);
                }
                
   }
}

module Boden_pur() {
    L=180-10;                                          // Länge
    B=100-10;                                          // Breite
    H=2;                                               // Höhe
    translate([0,-107,0])
    cube([L,H,B],center=true);
}

module Base_pur() {
    L=180;                                              // Länge
    B=100;                                               // Breite
    H=36;                                               // Höhe
    W=2;                                                // Wandstärke

    union() {
        difference() {
            cube([L,H,B],center=true);
            translate([0,-W,0])
            cube([L-W,H,B-W],center=true);
        }
    }
}

module Batteriehalterung() {
    rotate([0,-90,0])
    translate([-45,0,0])
    B_Halter();
    rotate([0,90,0])
    translate([0,0,0])
    B_Halter();
}

module B_Halter() {
    
    difference() {
        cylinder(d=20,h=30,center=true);
        cylinder(d=12,h=32,center=true);
        translate([0,-20,-20])
        cube([40,40,40]);
    }
}

module Turm () {
    if (Kopf) Kopf();
    if (Stand) Stand();
    if (Separation) {
        if (!Uhrfront) 
            rotate([0,0,-90]) Separation();
        else
            Separation();
    }
    if (Front)translate([0,0,-22]) Front();
    if (OLED) translate([0,0,-20]) OLED();
    if (Deckel) Deckel();
    if (Boden) Boden();
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
            translate([0,0,0])
            SSD1306_Screen(50,4);
            rotate([0,0,90])
            translate([0,0,4])
            mount();
        }
        else {
            translate([-0,0,1])
            cube([b-8,h-8,3],center=true);
            translate([0,0,0])
            SSD1306_Screen(50,4);
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
    
    union() {
        if (Base) translate([0,0,22]) Base();
        if (Platine) translate([-33,-91,22])Platine();
        if (Ladeplatine) translate([33,-93,35])Ladeplatine();
        if (Batterie) translate([67,-99,22])Batterie();

        if (!Turm3) {
            translate([0,0,22]) Turm();
        }
        else {
            for (i=[-1,0,1]) {
                translate([i*60,0,22]) Turm();
            }
        }
    }
    if (Schnitt) 
        translate([0,-150,-30])    
        cube([220,220,150]);

}


