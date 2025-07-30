
// Breadboard Box


box = true;
breadboard = false;
deckel = false;

bbL = 83;
bbB = 55;
bbH = 10;

boxH = 30;

if (box) box();
if (breadboard) breadboard();
if (deckel) deckel();

module breadboard() {
    color("white")
    union() {
        cube([bbL,bbB,bbH]);

        translate([bbL,bbB/2-2,1])
        cube([2,6,8]);

        translate([bbL,3,1])
        cube([2,6,8]);

        translate([bbL,bbB-3-5,1])
        cube([2,6,8]);

        translate([12,-2,1])
        cube([6,2,8]);

        translate([bbL-12-3.5,-2,1])
        cube([6,2,8]);
    }
}


module box(){
    
    translate([-2.5,-2.5,0])
    difference(){
        cube([bbL+5,bbB+5,boxH]);
        translate([2.0,2.0,-2.5])
        cube([bbL+1,bbB+1,boxH+5]);
        translate([2.5,2.5,0])
        breadboard();
        
        // Stromanschluss
        rotate([0,90,0])
        translate([-14-6,54-2,2+bbL])
        cylinder(d=8,h=5);
        
        // USB-Anschluss
        translate([-2,bbB/2-6/2,12])
        cube([5,12,5]);
    }
    
    nut();
    translate([bbL-5,bbB-5,0])
    nut();
    translate([0,bbB-5,0])
    nut();
    translate([bbL-5,0,0])
    nut();
}

module nut() {
    
    translate([-2.5,-2.5,25])
    difference() {
        cube([10,10,5]);
        translate([5,5,-1])
        cylinder(d=3,h=7);
    }
}

module deckel() {
    rotate([180,0,0])
    translate([0,-55,-30])
    color("orange")
    translate([-6,-6,-5])
    difference() {
        cube([bbL+12,bbB+12,10]);
        translate([2,2,5])
        cube([bbL+8,bbB+8,10]);
        
        translate([8.5,8.5,-1])
        cylinder(d=3,h=10);

        translate([bbL+12-8.5,8.5,-1])
        cylinder(d=3,h=10);

        translate([8.5,bbB+12-8.5,-1])
        cylinder(d=3,h=10);

        translate([bbL+12-8.5,bbB+12-8.5,-1])
        cylinder(d=3,h=10);
    }
}