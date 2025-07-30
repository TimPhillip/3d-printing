// Gewürzhalter
/*[ Teile ]*/
HalterStart = false;
HalterMitte = true;
HalterEnde = false;
Verbindung = false;

/*[ Anzahl ]*/
Anzahl = 3;

/*[ Grundmasse ]*/
H = 75;
// Höhe
AD = 50;
//Außendurchmesser
ID = 45;
// Innendurchmesser
W = 2;
// Wand
AB = 50;
// Abstand

/*[ Verbindermasse ]*/

VA = 20;
// Verbinder Außendurchmesser
VI = 16;
// Verbinder Innendurchmesser


module Halter(Start = false, Ende = false) {
    difference() {
        Saule();
        if (Start) translate([AB/2,0,2]) Durchbruch();
        if (Ende)  translate([-AB/2,0,2]) Durchbruch();
    }

    difference() {
        union() {
            if (Start) { 
                translate([AB/2,0,0]) Verbindung();
            }
            
            if (Ende) {
                translate([-AB/2,0,0]) 
                rotate([180,180,0]) Verbindung();
            }
        }
        
        translate([-125,0,0])
        cube([200,200,200],center=true);
         translate([125,0,0])
        cube([200,200,200],center=true);
    }
}


module Verbindungsteil() {
    difference() {
        cylinder(d=VA,h=H,center=true);
        translate([0,0,0])
        cylinder(d=VI,h=H+2,center=true);         // Hohlraum
        translate([0,6,0])
        cube([20,20,H+2],center=true);           // halbieren
    }
}

module Verbindung() {
    translate([0,VA,0])
    Verbindungsteil();
    
    translate([0,-VA,0])
    rotate([180,180,0])
    Verbindungsteil();
    
    translate([0,0,-H/2+W/2])
    cylinder(d=VA+W,h=W, center=true);
}

module Saule() {
    difference() {
        union() {
            cylinder(d=AD,h=H,center=true);
            translate([0,-AD/2,0])
            cube([25,8,H],center=true);
        }
        translate([0,0,W])
        cylinder(d=ID,h=H,center=true);         // Hohlraum
        
        cylinder(d=25,h=H+2,center=true);       // Bodenloch
        
        Bohrloch();
        
        Front();
        
    }
}

module Bohrloch() {
    rotate([90,0,0])
    translate([0,H/4,AD/2])
    union() {
        cylinder(d=4,h=40,$fn=60,center=true);  // Bohrloch
        translate([0,0,-4])
        cylinder(d=8,h=10,$fn=60,center=true);  // Versenkloch
    }
}

module Front() {
    translate([0,-6,0])
    union() {
        translate([-15,ID/2,17.5-15])
        cube([30,10,40],center=false);           // Frontgerade oben
        translate([-10,ID/2,17.5-20])
        cube([20,10,40],center=false);           // Frontgerade oben
        
        for (i=[-1,1])
            rotate([90,0,0])
            translate([10*i,17.5-15,-AD/2-2])
            cylinder(d=10,h=10,center=true);
        
        translate([-10,ID/2,-37.5+21])
        cube([20,10,15],center=false);           // Frontgerade unten
        
        translate([-5,ID/2,-37.5+15])
        cube([10,10,22],center=false);           // Frontgerade unten
        
        for (i=[-1,1])
            rotate([90,0,0])
            translate([5*i,17.5-35,-AD/2-2])
            cylinder(d=10,h=10,center=true);
        
    }
}

module Durchbruch() {
    cube([AD/2,ID/2+2*W,H],center=true);
}

if (Verbindung) Verbindung();
if (HalterStart) Halter(Start=true);
if (HalterMitte) Halter(Start=true, Ende=true);
if (HalterEnde) Halter(Ende=true);



if(Anzahl > 1) {    
    difference(){
        union() {
            for (i=[0:Anzahl-1]) {
                translate([i*(AB),0,0])
                if (i==0)Halter(Start=true);
                else if (i==Anzahl-1) Halter(Ende=true);
                else if(i!=0 && i!=Anzahl-1) Halter(Start=true, Ende=true);
            }
        }
    }
}