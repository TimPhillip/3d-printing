// Solarhalterung

a = 40;
Dreieck = true;
Doppeldreieck = false;

module Loch() {
    $fn=60;
    cylinder(d=8.5,h=10, center=true);
    translate([0,0,5])
    cylinder(d=13.5,h=10, center=true);
   
}

module Doppeldreieck() {
    
    difference(){
        union() {
            Dreieck();
            translate([0,37,0])
            Dreieck();
        }
        translate([5,17,5])
        cube([a,a-10,a],center=true);
    }
}    

module Dreieck() {
    
    difference() {
        cube([a,a,a],center=true);
        
        rotate([0,-45,0])
        translate([(a+25)/2,0,0])
        cube([a+25,a+25,a+25],center=true);
        
        translate([5,0,5])
        cube([a,a-10,a],center=true);
        
        translate([-4.25,0,-17])
        Loch();
        
        
        rotate([0,90,0])
        translate([0,0,-20])
        cylinder(d=5,h=20,center=true,$fn=60);
        
        rotate([0,90,0])
        translate([0,0,-7])
        cylinder(d=8,h=20,center=true,$fn=60);
    }
}

//translate([-10,0,-10])
//cube([20,40,20],center=true);

if (Dreieck)
translate([0,0,20])
Dreieck();

if (Doppeldreieck)
translate([0,0,20])
Doppeldreieck();