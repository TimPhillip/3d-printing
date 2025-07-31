// Stimmungsbarometer

use <D:\Programme\OpenSCAD\Things\28BY-48-Stepper\adapter_28BYJ-48_28_2.scad>

tl = 190;
tb = 190;
th = 3;

allsegment = true;
segment = true;
tafel = true;
pfeil = true;
motorstift = true;
stepperadapter1 = true;
stepperadapter2 = true;
sensorhalter = true;

$fn = 60;

if (tafel) tafel();
if (pfeil) pfeil();
if (segment) segment("green");
if (stepperadapter1) stepperadapter1();
if (stepperadapter2) stepperadapter2();
if (sensorhalter) sensorhalter();
    
if (allsegment) {


    segment("green");

    rotate([0,0,72])
    translate([0,0,0.1])
    segment("red");

    rotate([0,0,2*72])
    translate([0,0,0.2])
    segment("yellow");

    rotate([0,0,3*72])
    translate([0,0,0.3])
    segment("lightyellow");

    rotate([0,0,4*72])
    translate([0,0,0.4])
    segment("lightgreen");
 
}

module tafel() {
    color("white")
    difference(){
        cube([tl,tb,th],center=true);
        translate([0,0,-1])
        kreis();
        rotate([0,0,90])
        cylinder(d=10,h=10,center=true);
    }
}

module segment(color) {
    

    color(color)
    translate([0,0,-2])
    intersection() {
        difference(){
            cylinder(d=tl-11,h=2,center=true);
            cylinder(d=tl-49,h=3,center=true);
        }
        rotate([0,0,0])
        translate([0,100,0])
        cube([200,200,5],center=true);
        
        rotate([0,0,72])
        translate([0,-100,0])
        cube([200,200,5],center=true);
    }
}

module kreis() {
    
    color("white")
    union() {
        difference(){
            cylinder(d=tl-10,h=2,center=true);
            cylinder(d=tl-50,h=3,center=true);
        }
    }
}

module motorstift() {
msd = 5.2;
msh = 11;
    difference() {
        cylinder(d=msd, h=msh,center=true);
        translate([0,4.5,0])
        cube([msd,msd,msh],center=true);
        translate([0,-4.5,0])
        cube([msd,msd,msh],center=true);
    }
}


module pfeil(){
    color("black")
    translate([0,0,-5])
    difference() {
        translate([-10,-15,0])
        cube([90,30,th]);
        
        translate([80.5,-41.5,-2])
        rotate([0,0,45])
        cube([30,30,8]);
        
        translate([59,21.5,-2])
        rotate([0,0,-45])
        cube([30,30,8]);

    }
    difference() {
        color("black")
        rotate([0,0,90])
        cylinder(d=9,h=10,center=true);
        if (motorstift)
            translate([0,0,7]) motorstift();
    }
}

module stepperadapter1() {
    rotate([0,180,0])
    translate([1,-5,0])
    difference() {
        adp();
        translate([0,0,-35])
        cube([50,50,50], center=true);
    }

}

module stepperadapter2() {
    rotate([0,180,0])
    translate([1,-5,0])
    difference() {
        translate([0,0,-10])
        adp();
        translate([0,0,-50])
        cube([50,50,50], center=true);
    }
}

module sensorhalter() {
    
    translate([0,60,5.5])
    difference() {
        cube([26,30,7],center=true);
        translate([0,1,-2])
        cube([20,30,2],center=true);
        translate([0,1,0])
        cube([10,30,9],center=true);
    }
}