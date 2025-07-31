//
// Fraesabsauger
//

$fn=60;

G=37.5;
K=34.5;
H=20;
W=3.5;

Staubrohr=true;
Buerstenrohr=true;

module Konus(GG,HH){
    
    hull() {
        translate([0,0,-HH/2])
        cylinder(d=GG+1,h=1,center=true);
        translate([0,0,HH/2])
        cylinder(d=GG-1,h=1,center=true);
    }
}

module Adapter(GG,HH) {
    
    difference() {
        cylinder(d=GG+W,h=HH,center=true);
        Konus(GG,HH+1);
    }
}


module Staubsaugeradapter() {
    Adapter(G,H);               // grosser Adapter
    color("Gray")
    translate([0,0,H-3])
    rotate([180,0,0])
    Adapter(K,H);               // kleiner Adapter
}

Staubsaugeradapter();

if (Staubrohr) color("Green")
translate([0,0,-105])
cylinder(d=G,h=100);

if (Buerstenrohr) color("Blue")
translate([0,0,5])
cylinder(d=K,h=100);
