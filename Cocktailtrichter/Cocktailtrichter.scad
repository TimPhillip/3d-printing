// Cocktailtrichter
use <..\LiquidDetector\SensorBox.scad>;

tx = 180;
ty = 70;
tz = 10;
tw = 2*2;

agd = 12;
agh = 20;
agw = 2;

hx = 10;
hy = ty+10;
hz = tz;

$fn = 60;

trichter = true;
abstandhalter = true;
abstandhalter_alleine = true;
detector = true;
deckel = true;
auslass = true;

cocktailtrichter = false;
if (cocktailtrichter) cocktailtrichter();
    


if (deckel) deckel();
if (auslass) auslass();
    

if (detector) {
    for (i = [-4 : 1 : -1]) {
        translate([45+22*i,20,0])
        detector();
    }
    for (i = [-4 : 1 : -1]) {
        translate([45+22*i,-20,0])
        detector();
    }
}
    
if (trichter) trichter();
if (abstandhalter) {
    rotate([0,0,180])
    translate([tx/2,0,0])
    abstandhalter();
    

    translate([tx/2,0,0])
    abstandhalter();
}

if (abstandhalter_alleine) {
    
    translate([tx/2,0,0])
    abstandhalter();
}

module cocktailtrichter() {
    trichter();
    rotate([0,0,180])
    translate([tx/2,0,0])
    abstandhalter();
    

    translate([tx/2,0,0])
    abstandhalter();
    
    deckel();
    auslass();
} 


module trichter() {
    color("lightblue")
    difference() {
        cube([tx,ty,tz],center=true);
        translate([0,0,10+tz/2])
        scale([1.3,0.6,0.32])
        sphere(r=60);
        translate([0,0,-tz/2])
        cylinder(d=agd,h=agh,center=true);
        
    }
    
    if (auslass) auslass();
}

module auslass() {
    color("lightblue")
    translate([0,0,-tz/2-agh/2+1])
    difference() {
        cylinder(d2=agd,d1=6,h=agh,center=true);
        cylinder(d2=agd-agw,d1=4,h=agh+agw,center=true);
    }
}

module abstandhalter() {
    translate([0,0,-tw/2])
    color("green")
    difference() {
        cube([hx*2,hy,hz+tw],center=true);
        translate([-hx/2,0,tw])
        cube([hx+2,hy-hx+2,hz+tw],center=true);
        
        translate([0,-25,0])
        rotate([0,90,0])
        cylinder(d=2.5,h=40,center=true);
        
        translate([0,25,0])
        rotate([0,90,0])
        cylinder(d=2.5,h=40,center=true);
        
        translate([7,0,0])
        cube([7,20,tz+5],center=true);
    }
}

module detector() {
    rotate([0,90,0])
    translate([-82,-12.5,3])
    union() {
        box();
        translate([0,0,10])
        head();
    }
}

module deckel () {
    color("red")
    translate([0,0,tz/2+1])
    difference() {
        cube([tx,ty,tw/2],center=true);
        rotate([0,0,90])
        translate([ty/2-7,tx/2-7,0])
        cylinder(d=2.5,h=40,center=true);
        
        rotate([0,0,90])
        translate([-ty/2+7,tx/2-7,0])
        cylinder(d=2.5,h=40,center=true);
        
        rotate([0,0,90])
        translate([-ty/2+7,-tx/2+7,0])
        cylinder(d=2.5,h=40,center=true);

        rotate([0,0,90])
        translate([ty/2-7,-tx/2+7,0])
        cylinder(d=2.5,h=40,center=true);

        for (i = [0 : 1 : 3]) {
            translate([22*i - 33,20,0])
            cylinder(d=5,h=10,center=true);
        }
        for (i = [0 : 1 : 3]) {
            translate([22*i - 33,-20,0])
            cylinder(d=5,h=10,center=true);
        }


    }
}