// Ampel

Front = true;
Box = true;
Stand = true;
Base = true;

Fertig = false;
LED = false;




// intern
module intern() {
}

// Ampelfrontgehäuse
frontx = 32;
fronty = 17;

// Ampelgehäuse
box = frontx;
boy = fronty;
boz = 10;

// Ampelständer
stand = 5.75;
stanh = 25;


// Ampelbasis
basx = 45;
basy = 30;
basz = 15;

module Licht() {
    cylinder(d=5,h=5,center=true);
}

module Schirm() {
    translate([0,0,3])
    difference() {
        cylinder(d=9,h=5,center=true);
        cylinder(d=8,h=7,center=true);
        
        translate([11,0,0])
        cube([18,18,18],center=true);
        
        rotate([0,-65,0])
        translate([9,0,0])
        cube([18,18,18],center=true);
        
    }
}

module LED() {
    $fn=60;
    color("red") Licht();
    translate([7.5,0,0])
    color("yellow") Licht();
    translate([15,0,0])
    color("green") Licht();
}

module Stand() {
    $fn=60;
    rotate([0,90,0])
    difference() {
        cylinder(d=stand,h=stanh,center=true);
        cylinder(d=stand-.75,h=stanh+5,center=true);
    }
}

module Box() {
    $fn=60;
    difference() {
        hull() {
            a=box/2;
            b=boy/2;
            translate([a,b,0])
            cylinder(d=3,h=boz,center=true);
            translate([-a,b,0])
            cylinder(d=3,h=boz,center=true);
            translate([a,-b,0])
            cylinder(d=3,h=boz,center=true);
            translate([-a,-b,0])
            cylinder(d=3,h=boz,center=true);
            
        }
        translate([0,0,2])
        cube([box-2,boy-2,boz],center=true);

        translate([20,0,0])
        rotate([0,90,0])
        cylinder(d=stand+0.75,h=stanh,center=true);
    }
}

module Base() {
    $fn=60;
    rotate([0,90,0])
    difference() {
        cube([basx,basy,basz],center=true);
        translate([0,0,2])
        cube([basx-4,basy-4,basz],center=true);

        translate([-10,0,0])
        cylinder(d=stand,h=stanh,center=true);
    }
}

module Front() {
    $fn=60;
    difference() {
        hull() {
            a=frontx/2;
            b=fronty/2;
            translate([a,b,0])
            cylinder(d=3,h=2,center=true);
            translate([-a,b,0])
            cylinder(d=3,h=2,center=true);
            translate([a,-b,0])
            cylinder(d=3,h=2,center=true);
            translate([-a,-b,0])
            cylinder(d=3,h=2,center=true);
        }
        
        cylinder(d=6,h=5,center=true);
        translate([7.5,0,0])
        cylinder(d=6,h=5,center=true);
        translate([-7.5,0,0])
        cylinder(d=6,h=5,center=true);
    }
    
    Schirm();
    translate([-7.5,0,0])
    Schirm();
    translate([7.5,0,0])
    Schirm();
}

if (Fertig) scale ([0.5,0.5,0.5])import("parts-black.stl",convexity=3);
if (LED) translate([-7.5,0,0]) LED();
    
if (Front)
color("darkgreen")
Front();

if (Box)
color("darkgreen")
translate([0,0,-boz])
Box();

if (Stand)
color("darkgreen")
translate([box,0,-boz])
Stand();

if (Base)
color("darkgreen")
translate([box+stanh/2+basz/2-2,0,-2*boz])
Base();

