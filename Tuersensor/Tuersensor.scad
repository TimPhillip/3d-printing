// Türsensor

use <../SchraubenUndMuttern/metric_iso_screw.scad>

Exzenter = false;
Blende = true;
HMSecRHS = false;
Knauf = true;
Ring = true;
Mutter = true;
Deckel = true;

module Exzenter() {

    difference() {
        union() {
            cylinder(d=15.8,h=0.8,center=true);
            translate([0,1.5,0])
            cylinder(d=12.8,h=2.4,center=true);
        }
        cube([8.4,8.4,5],center=true);
    }
}

module BlendeOben() {
    minkowski() {
        cube([40,2,8],center=true);
        sphere(d=3);
    }
}

module BlendeUnten() {
    minkowski() {
        cube([36,2,8],center=true);
        sphere(d=3);
    }
}

module Schraubloch() {
    cylinder(d=4,h=20,center=true,$fn=40);
    translate([0,0,8])
    cylinder(d=7,h=10,center=true,$fn=40);
}

module Blende() {
    translate([0,2.5,5])
    difference() {
        hull() {
            BlendeOben();
            translate([0,250,0])
            BlendeUnten();
        }
        translate([0,250-2,0])
        Schraubloch();
        translate([-13.25,5,0])
        Schraubloch();
        translate([13.25,5,0])
        Schraubloch();

        translate([0,81,0])
        cylinder(d=21.5,h=20,center=true,$fn=40);
        translate([0,81+78,0])
        cylinder(d=21.5,h=20,center=true,$fn=40);
        
        translate([0,125,-2])
        cube([34,240,8],center=true);

        translate([0,218,12])
        cube([33,50,20],center=true);

    }
    
    translate([0,220,12])
    difference() {
        minkowski() {
            cube([34,51,8],center=true);
            sphere(d=3);
        }
        translate([0,0,-2])
        cube([33,50,22],center=true);
    }

}

module HMSecRHS() {
    translate([0,180,3])
    difference() {
        union(){
            cube([30,130,5],center=true);
            translate([0,40,10])
            cube([30,50,20],center=true);
        }
        
        translate([0,-20,0])
        cylinder(d=20,h=30,center=true);
    }
}

module Halbscheibe() {
    difference() {
        scale([1.1,2.1,0.3])
        sphere(d=21,$fn=40);
        translate([0,0,20])
        cube([65,65,40],center=true);
    }
}

module Halbelipse() {
    difference() {
        scale([1.1,2.1,2])
        sphere(d=21,$fn=40);
        translate([0,0,-20])
        cube([65,65,40],center=true);
    }
}

module Schaft() {
    translate([0,0,-6.5])
    difference() {
        union() {
            cylinder(d=23,h=13,$fn=40,center=true);
//            cylinder(d=17,h=30,$fn=40,center=true);
            
            translate([0,0,-15.5]) rotate(180,[0,0,1])
            screw_thread_iso_inner(d=17,lt=30,$fn=60); 
        }
        translate([0,0,-5])
        cube([8.5,8.5,30],center=true);
    }
}
    
module Knauf() {
    translate([0,161.5,24])
    union() {
        Halbscheibe();
        Halbelipse();
        Schaft();
    }
}
    

module Ring() {
    translate([0,161.5,9])
    union() {
        difference() {
            cylinder(d=21.0,h=5,center=true);
            cylinder(d=18.0,h=7,center=true);
        }
        translate([0,0,2])
        difference() {
            cylinder(d=23.5,h=1,center=true);
            cylinder(d=18.0,h=5,center=true);
        }
    }
}

module Mutter() {
    translate([0,161.5,0])
    hex_nut_iso(d=17,hg=3,$fn=60);
}

module Deckel() {
    translate([0,220,17])
    difference() {
        minkowski(){
            cube([39.5,60.5,10],center=true);
            sphere(r=1);
         }
         translate([0,0,-2])
         cube([38.5,54.5,10],center=true);
    }   
}

if (HMSecRHS) HMSecRHS();
if (Exzenter) Exzenter();
if (Blende) Blende();
if (Knauf) Knauf();
if (Ring) Ring();
if (Mutter) Mutter();
if (Deckel) Deckel();
