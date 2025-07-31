// Jung ST 550

Jung = true;
Homematic = true;
Rahmen3Fach = true;

module Halter(a,b,c,r) {
       hull(){
            $fn=90;
            translate([a-r/2,b-r/2,0])
            cylinder(d=r,h=c,center=true);
            translate([-a+r/2,-b+r/2,0])
            cylinder(d=r,h=c,center=true);
            translate([-a+r/2,b-r/2,0])
            cylinder(d=r,h=c,center=true);
            translate([a-r/2,-b+r/2,0])
            cylinder(d=r,h=c,center=true);
        }
}

module HalterMitRastschlitz(a,b,c,r) {
        Halter(a,b,c,r);
        Rastschlitz();
        rotate([0,0,90])
        Rastschlitz();
        rotate([0,0,180])
        Rastschlitz();
        rotate([0,0,270])
        Rastschlitz();
}

module HalterGewoelbt(a,b,c,r) {
       hull(){
            $fn=90;
            translate([a-r/2,b-r/2,-1])
            cylinder(d=r,h=c+1,center=true);
            translate([-a+r/2,-b+r/2,-1])
            cylinder(d=r,h=c+1,center=true);
            translate([-a+r/2,b-r/2,-1])
            cylinder(d=r,h=c+1,center=true);
            translate([a-r/2,-b+r/2,-1])
            cylinder(d=r,h=c+1,center=true);
            translate([0,0,-2])
            cylinder(d=r,h=c+7,center=true);
        }
}

module Halterahmen() {
    difference() {
        Halter(55/2,55/2,3.0,8.0);
        Halter(41.5/2,51.5/2,20.0,2.5);
    }
}

module Schlitz(){
    $fn=90;
    hull(){
        translate([0,-10,0])
        cylinder(d=3,h=3,center=true);
        translate([0,+10,0])
        cylinder(d=3,h=3,center=true);
    }
}

module Aussenrahmen() {
    translate([0,0,-2.25])
    difference() {
        HalterGewoelbt(67.5/2,67.5/2,2.0,8.0);
        Halter(41.5/2,51.5/2,14.0,2.5);
    }
}

module AussenrahmenHomematic() {
    translate([0,0,-2.25])
    difference() {
        HalterGewoelbt(67.5/2,67.5/2,2.0,8.0);
        Halter(56.5/2,56.5/2,10.0,2.5);
    }
}

module Rastnase() {
    translate([0,58.5/2,-1])
    cube([20,2,3], center=true);
}

module Rastschlitz() {
    translate([0,58.5/2,-1])
    cube([21,3,7], center=true);
}

module Jungrahmen() {
    difference() {
        Halterahmen();
        translate([-24,-14,1])
        Schlitz();
        translate([24,14,1])
        Schlitz();
        translate([-24,14,1])
        Schlitz();
        translate([24,-14,1])
        Schlitz();
    }
    Aussenrahmen();
    union() {
        translate([0,-1,0])
        Rastnase();
        rotate([0,0,90])
        translate([0,-1,0])
        Rastnase();
        rotate([0,0,180])
        translate([0,-1,0])
        Rastnase();
        rotate([0,0,270])
        translate([0,-1,0])
        Rastnase();
    }
}


module AdapterHomematic() {
    AussenrahmenHomematic();
    union()         translate([0,0,2])
{
        Rastnase();
        rotate([0,0,90])
        Rastnase();
        rotate([0,0,180])
        Rastnase();
        rotate([0,0,270])
        Rastnase();
    }
}

module Rahmen3Fach() {

    difference() {
        Halter(222.0/2,80.0/2,4.5,8.0);
        translate([0,0,2])
        Halter(216/2,76/2,4.5,8.0);
        HalterMitRastschlitz(56.5/2,56.5/2,10.0,2.5);
        translate([+70.5,0,0])
        HalterMitRastschlitz(56.5/2,56.5/2,10.0,2.5);
        translate([-70.5,0,0])
        HalterMitRastschlitz(56.5/2,56.5/2,10.0,2.5);
    }

}

if (Jung) Jungrahmen();

if (Homematic) AdapterHomematic();
    
if (Rahmen3Fach) Rahmen3Fach();