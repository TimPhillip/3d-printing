// Reagenzglashalter


use<..\SchraubenundMuttern\ISOThread_20120823.scad>;

$fn=60;
intersection(){
    difference(){
        hex_nut(28);
        translate([0,0,10+5])
        cylinder(h=20,d=50, center=true);
    }
    translate([0,0,2.5])
    difference(){
        cylinder(h=5,d=36, center=true);
        cylinder(h=6,d=25, center=true);
    }
}


