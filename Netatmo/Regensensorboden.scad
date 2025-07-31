//Netatmo Regensensorboden


module Wand() {
    $fn=90;
    difference(){
        cylinder(h=9,d=94,center=true);
        cylinder(h=10,d=86,center=true);
    }
}


module Boden() {
    $fn=90;
    translate([0,0,-3])
    difference() {
//        cylinder(h=3,d=94,center=true);
        cube([20,90,3],center=true);
        cylinder(h=7,d=6.5,center=true);
    }
}


module Halter() {
    difference() {
        translate([46,0,-20])
        cube([5,80,50],center=true);
        cylinder(h=10,d=86,center=true);
        
        rotate([0,90,0])
        translate([15,20,0])
        cylinder(h=150,d=4,center=true);    
        
        rotate([0,90,0])
        translate([15,-20,0])
        cylinder(h=150,d=4,center=true);    
        
        rotate([0,90,0])
        translate([35,20,0])
        cylinder(h=150,d=4,center=true);    
        
        rotate([0,90,0])
        translate([35,-20,0])
        cylinder(h=150,d=4,center=true);   
   }
   
   rotate([0,45,0])
   translate([7,-40,0])
   cube([55,10,5]);
   
   rotate([0,45,0])
   translate([7,30,0])
   cube([55,10,5]);
}

Wand();
Boden();
Halter();