// Wegweiser
Stiel =true;
Weg=true;
Wegweiser=true;

module Wegweiser(){
        Weg();
        
        
        rotate([0,0,-74])
        translate([0,0,75])
        Weg();
        
        rotate([0,0,90])
        translate([0,0,50])
        Weg();
        
        rotate([0,0,64])
        translate([0,0,25])
        Weg();
}

module Stiel() {
    difference(){
        cylinder(d=10,h=110,$fn=60);
        Wegweiser();
    }
    
    cylinder(d=40,h=3,$fn=60);
}

module Weg(){
    translate([-1,-5,10]) {
        cube([3,50,15]);
        translate([0,50,0])
        rotate([45,0,0])
        cube([3,10.5,10.5]);
    }
}

if (Stiel) Stiel();
if (Weg) Weg();
if (Wegweiser) Wegweiser();