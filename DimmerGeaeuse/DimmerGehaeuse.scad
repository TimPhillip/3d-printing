// Dimmer Gehäuse

Gehause = true;
Boden = false;

module Kreissegment(R,W,H) {

    difference() {
        cylinder(r=R,h=H,$fn=60);
        translate([0,0,-0.5])
        cylinder(r=R-W,h=H+1,$fn=60);
    }
}

module Sekante(R,W,H,S){
    translate([0,-R+H,0])
    difference(){
        Kreissegment(R,W,H);
        translate([0,-S,H/2])
        cube([2*R+1,2*R,H+1],center=true);
    }
}

module Box(){
    cube([60,30,60],center=true);
}

module Deckel() {
    intersection() {
        Sekante(248,3,60,40);
        translate([0,50,30])
        Box();
    }
}

module Haus() {
    translate([0,43,30])
    difference(){
        Box();
        translate([0,0,0])
        cube([56,32,56],center=true);
    }    
}

module Gewindehalter() {
    difference() {            
        cylinder(d=8,h=8,$fn=60,center=true);
        cylinder(d=3,h=9,$fn=60,center=true);
    }
}

module Platinenhalterung() {
    translate([0,4,0])
    for (i=[-1,1])
        for (j=[-1,0,1])
            rotate([90,0,0])
            translate([17.5*i,17.5*j,0])
            Gewindehalter();
}

module Rasten() {
    for (i=[0,90,180,270])
        rotate([i,0,90])
        translate([0,27.5,-20])
        cylinder(d=2,h=40);
}

module Boden(){
    translate([0,28,30])
    union(){
        cube([55,2,55],center=true);
        Platinenhalterung();
        Rasten();
    }
}

module Gehause() {
    difference(){
        union() {
            Deckel();
            Haus();
        }
        translate([-15,45,0])
        cylinder(d=8,h=10,center=true);
        translate([15,45,0])
        cylinder(d=8,h=10,center=true);
        
        translate([0,45,60])
        cylinder(d=8,h=10,center=true);
        
        translate([0,30,30])
        scale(1.05)
        Rasten();
    }
}

if (Gehause) Gehause();
if (Boden) Boden();