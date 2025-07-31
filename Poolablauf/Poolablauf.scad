// Poolablauf
$fn =120;
Verstaerkung = false;
neu = false;
neu_english = true;

use <../SchraubenUndMuttern/ISOThread_20120823.scad>;
use <../SchraubenUndMuttern/english-threads.scad>;

module Ablauf() {
    union(){

            import ("Poolabflussv7.stl");
    }       
}

if (Verstaerkung) 

union(){
    Ablauf();
    difference(){
        translate([0,0,-26.5])
        cylinder(r1=20, r2=17, h=26.5);
        translate([0,0,-27.0])
        cylinder(d=18,h=27.5);
    }  

}

if (neu)
    
union() {
    difference(){
        union(){
            translate([0,0,-0.5])
            thread_out(26,15);
            cylinder(d=35,h=8, center=true);
            translate([0,0,-14.5])
            thread_out(25,15);
        }
        cylinder(d=18,h=36, center=true);
    }
}


if (neu_english)
    
union() {
    difference(){
        union(){
            translate([0,0,-0.5])
            english_thread (diameter=1, threads_per_inch=14, length=5/8);
            cylinder(d=35,h=8, center=true);
            translate([0,0,-14.5])
            english_thread (diameter=1, threads_per_inch=11, length=5/8);
        }
        cylinder(d=16,h=36, center=true);
    }
}


