// gelber Motor

$fn = 30;

module gelberMotor() {
    hinten();
    mitte();
    vorne();
}

module hinten() {
    difference() {
        cube([22.5,36.8,19.1],center=true);
        translate([8.25,-13.1,0])
        cylinder(d=3.5,h=36.6,center=true);
        translate([-8.25,-13.1,0])
        cylinder(d=3.5,h=36.6,center=true);
    }
    color("white")
    translate([0,7.45,0])
    cylinder(d=5.5,h=36.6,center=true);
    translate([0,21,0])
    difference() {
        cube([4.8,5.3,3],center=true);
        cylinder(d=3.5,h=36.6,center=true);
    }
}

module mitte() {
    difference() {
        rotate([90,0,0])
        translate([0,0,24])
        cylinder(d=22.5,h=12,center=true);
        translate([0,-24,14.1])
        cube([16,16,9],center=true);
        translate([0,-24,-14.1])
        cube([16,16,9],center=true);
    }
}

module vorne() {
    difference() {
        color("lightgray")
        rotate([90,0,0])
        translate([0,0,33])
        cylinder(d=20.5,h=8,center=true);
        translate([0,-33,13.1])
        cube([16,16,9],center=true);
        translate([0,-33,-13.1])
        cube([16,16,9],center=true);
    }
    
    difference() {
        color("gray")
        rotate([90,0,0])
        translate([0,0,40.5])
        cylinder(d=20.5,h=7,center=true);
        translate([0,-40.5,13.1])
        cube([16,16,9],center=true);
        translate([0,-40.5,-13.1])
        cube([16,16,9],center=true);
    }
    
    difference() {
        color("gray")
        rotate([90,0,0])
        translate([0,0,40])
        cylinder(d=9.8,h=4,center=true);
        translate([0,-36,13.1])
        cube([16,16,9],center=true);
        translate([0,-36,-13.1])
        cube([16,16,9],center=true);
    }
}
translate([0,10,0])
gelberMotor();


