// Leinwandsystem

Rahmen = true;
Verlaengerung = true;
Kurbel = false;
Balken = false;
Balkenverlaengerung = false;
Traeger = false;
Rolle = false;
Langrolle = false;
Antrieb = false;
Zahnstange = false;


module Rahmen() {
  
    translate([0,0,50])
    Balken();
    translate([0,0,-50])
    Balken();

    translate([-47.5,0,0])
    Traeger();

    translate([45,0,0])
    Rolle();
    translate([-40,0,0])
    Rolle();

}

module Verlaengerung() {
    translate([0,0,50])
    Balkenverlaengerung();

    translate([0,0,-50])
    Balkenverlaengerung();
    
    translate([46,86,0])
    Rolle();
    
    translate([46,93.5,0])
    rotate([0,0,90])
    Traeger();
}
module Traeger(){
    difference(){
        cube([5,8,100], center=true);
        cylinder(d=2,h=110,$fn=60, center=true);
    }
}
        
module Balken(){
    difference(){
        cube([100,8,8], center=true);
        translate([45,0,-5])
        cylinder(d=6,h=10,$fn=60);
        translate([-40,0,-5])
        cylinder(d=6,h=10,$fn=60);
        
        translate([-47.5,0,-5])
        cylinder(d=2,h=10,$fn=60);
        translate([20,0,-5])
        cylinder(d=2,h=10,$fn=60);
    }
}

module Balkenverlaengerung(){
    rotate([0,0,90])
    translate([46,-46,0])
    difference(){
        cube([100,8,8], center=true);
        translate([40,0,-5])
        cylinder(d=6,h=10,$fn=60);
        translate([-46,1,-5])
        cylinder(d=6,h=10,$fn=60);
        
        translate([47.5,0,-5])
        cylinder(d=2,h=10,$fn=60);
        translate([-20,0,-5])
        cylinder(d=2,h=10,$fn=60);
    }
}

module Rolle(){
    cylinder(d=8,h=91,$fn=60, center=true);
    cylinder(d=5,h=110,$fn=60, center=true);
}

module Langrolle(){
    cylinder(d=8,h=91,$fn=60, center=true);
    translate([0,0,5])
    cylinder(d=5,h=120,$fn=60, center=true);
}

module Kurbel() {
    cube([20,8,8],center=true);
    translate([6,0,10])
    difference(){
        cube([8,8,20],center=true);
        cylinder(d=5,h=30);
    }
    translate([-6,0,-20])
    cylinder(d=5,h=20,$fn=60);

}

module Zahn() {
    hull() {
        cube([7,5,3], center=true);
        translate([5,0,0])
        cube([2,2,2], center=true);
    }
}

module Antrieb() {
    difference() {
        cylinder(d=15,h=3.0,$fn=60, center=true);
        cylinder(d=8, h=10, $fn=60, center = true);
    }        
        for (i=[0:1:7]) 
            rotate([0,0,360/8*i])
            translate([10,0,0]){
                translate([0,0,0])
                Zahn();
        }
}

module Zahnstange() {
    translate([0,15,0])
    difference(){
        cube([100,5,4], center = true);
        for (i=[-8:1:8]) 
            rotate([0,0,90])
            translate([-3,i*12,0]) cube([8,8,4.5], center = true);
    }
}


if (Rahmen) Rahmen();
if (Verlaengerung) Verlaengerung();
if (Balken) Balken();
if (Balkenverlaengerung) Balkenverlaengerung();
if (Traeger) Traeger();
if (Rolle) Rolle();
if (Langrolle) Langrolle();
if (Kurbel) Kurbel();
if (Antrieb) rotate([0,0,$t*360]) Antrieb();
if (Zahnstange) Zahnstange();
