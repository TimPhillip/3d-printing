// Tipp Kick Netz V2

Wabe=10;
Dicke=8;

Tor = true;
Tor_Front = false;
Netz_halblinks = false;
Netz_halbrechts = false;
Seitennetz = false;; 
Hauptnetz = false;; 
Lattennetztraeger_oben = false;
Lattennetztraeger_unten = false;
Halterung = false;
Spanner = false;

module mod(){}

Faden=Dicke/10;

module end() {
}

Wabehalbe = Wabe/2;
Abstand = Wabe-Faden;

Hoehe = 75;
Breite = 140;

module Spanner() {
    translate([0,-45.5,0])
    difference() { 
        union(){
            cube([2,14,10]);
            rotate([-90,0,0])
            translate([-2,0,0])
            cylinder(d=8,h=14);
        }
        rotate([-90,0,0])
        translate([-2,0,0])
        cylinder(d=4,h=16);
        translate([-14,-4,1])
        cube([14,20,6]);
        translate([-14,5.5,-10])
        cube([14,3,14]);
   }
}

module Halterung() {
    br=2;
    ti=7;
    translate([-4,-40,0])
    difference() {
        union(){
            cube([2,br,Hoehe]);           
            translate([0,br/2,Hoehe])
            rotate([0,90,0])
            cylinder(d=ti,h=br,center=true);
        }
        rotate([0,90,0])
        translate([-Hoehe,1,-5])
        cylinder(d=ti-4,h=20,$fn=40);
    }
    translate([-4,-46,0])
    cube([br,15,2]);           
}

module Wabe() {
    difference() {
        cube([Wabe, Wabe, Faden]);
        translate([Faden,Faden,-1])
        cube([Wabe-2*Faden, Wabe-2*Faden, Faden+4]);
    }
}



module Netz(xi, yj) {
    
    translate([0,0,0])
    for (i=[0:1:xi-1]){ 
        for (j=[0:1:yj-1]){         
            if (i%2 == 0) translate([i*Abstand,j*Abstand,0]) Wabe();
            else translate([i*(Abstand),j*Abstand+Wabehalbe-Faden,0]) Wabe();
        }
    }
}


module Rahmen(xi,yj) {
    translate([0,0,0])
    difference(){
        cube([Abstand*xi+Faden,Abstand*yj+Wabehalbe,Faden]);
        translate([Faden,Faden,-0.5])
        cube([Abstand*xi-Faden,Abstand*yj+Wabehalbe-2*Faden,4*Faden]);
    }    

}

module Latte() {
    translate([Breite/2+4,0,Hoehe])
    rotate([-90,0,90])
    difference() {
        cylinder(d=8,h=Breite+8);
        translate([-4,0,0])
        cylinder(d=9,h=Breite+9);
    }
}

module Lattennetztraeger() {
    translate([0,0,0.5])
    Lattennetztraeger_oben();
    translate([0,0,-0.5])
    Lattennetztraeger_unten();
}

module Lattennetztraeger_oben() {
    translate([Breite/2-5,0,Hoehe])
    difference() {
        rotate([-90,0,90])
        cylinder(d=4,h=Breite-10);
        translate([-Breite/2,0,-2])
        cube([200,40,4], center=true);
    }
}

module Lattennetztraeger_unten() {
    translate([Breite/2-5,0,Hoehe])
    difference() {
        rotate([-90,0,90])
        cylinder(d=4,h=Breite-10);
        translate([-Breite/2,0,2])
        cube([200,40,4], center=true);
    }
}

module Pfosten() {
    difference() {
        translate([0,0,0])
        cylinder(d=8,h=75);
        translate([0,-4,0])
        cylinder(d=9,h=75);

    }
}

module Netztraeger() {
    translate([0,0,2])
    rotate([90,0,0])
    cylinder(d=4,h=80);

    translate([0,0,Hoehe-2])
    rotate([90,0,0])
    cylinder(d=4,h=40);

    translate([0,-78,2])
    rotate([-28.5,0,0])
    cylinder(d=4,h=Hoehe+6.1);
    
    translate([0,-2,0])
    rotate([0,0,0])
    cylinder(d=4,h=Hoehe);
}

module Netztraeger_halblinks() { 
    difference() {
        Netztraeger();
        translate([-4,-150,-2])
        cube([4,300,300]);
    }
}

module Netztraeger_halbrechts() { 
    difference() {
        Netztraeger();
        translate([-0,-150,-2])
        cube([4,300,300]);
    }
}

module Netz_links() {
    translate([70.5,0,0])
    Netztraeger_halblinks();
    translate([69.5,0,0])
    Netztraeger_halbrechts();
}

module Netz_rechts() {
    translate([-69.5,0,0])
    Netztraeger_halblinks();
    translate([-70.5,0,0])
    Netztraeger_halbrechts();
}

module Tor_Front() {
    Latte();
    translate([70,0,0])
    Pfosten();
    translate([-70,0,0])
    Pfosten();
}

module Tor() {
    
    Tor_Front();
    Lattennetztraeger();
    
    Netz_links();
    
    Netz_rechts();
    
    translate([70.5,0,0])
    Seitennetz();
    translate([-69.75,0,0])
    Seitennetz();
    
    Hauptnetz();
}


module Tornetz(a,b) {
    Netz(a,b);
    Rahmen(a,b);
}

module Seitennetz() {
        rotate([90,0,-90])
        Tornetz(9,8);
}

module Hauptnetz() {
        translate([-88,-125,74.5])
        Tornetz(19,13);
}

if (Tor) Tor();
//
if (Tor_Front) Tor_Front();
if (Netz_halblinks) Netztraeger_halblinks();
if (Netz_halbrechts)Netztraeger_halbrechts();
if (Seitennetz) Seitennetz(); 
if (Hauptnetz) Hauptnetz(); 
if (Lattennetztraeger_oben) Lattennetztraeger_oben(); 
if (Lattennetztraeger_unten) Lattennetztraeger_unten(); 
if (Halterung) Halterung();
if (Spanner) Spanner();