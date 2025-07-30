// Weiche

use<../Schienen.scad>;


Weiche_oben();

//translate([30,37,0]) Stellklotz();

module Weiche_oben () {
    difference() {
        union () {
            schiene(180,30);
            schiene(210,0);
        }
        translate([1.5,0,0])
        Luecke();

        rotate([0,0,10])
        translate([-25.5,0,0])
        Luecke();
        
        translate([-17.5,140,0])
        Spalte();
        
        translate([-17.0,144,0])
        rotate([0,0,28])
        Spalte();
        
        translate([-22.5,35.5,0])
        Kasten();
        
        translate([-35,50,0])
        Boden();
    }
    translate([-35,50,0])
    Weiche();

    rotate([0,0,25])
    translate([186,140,0])
    Spurhalter();

    

}
module Luecke(){

    translate([13,0,2])
    cube([3,80,3.5]);
    
}

module Spalte(){

    translate([0,0,2])
    cube([5,30,3.5]);
    
}

module Kasten() {
    translate([0,0,2.0])
    cube([39,65,1]);
}

module Boden() { 
    translate([0,0,-0.5])
    cube([65,15,3]);
} 

module Weiche() {
    
    difference() {
        translate([-20,1,0])
        cube([105,13,2.0]);
        
        translate([-5,6.5,-2])
        cylinder(d=2.5, h=5);
        
        translate([70,6.5,-2])
        cylinder(d=2.5, h=5);
    }
    translate([16,3,0])
    cube([1,11,4.0]);
    
    translate([49,1,0])
    cube([1,13,4.0]);
} 

module Stellklotz() {
    $fn =30;
    color("white")
    translate([0,15,2])
    union() {
//        translate([0,-0.5,0])
//        cube([10,10,15]);
        translate([0,4.5,0])
        cylinder(d=24,h=3);
        
        translate([5,4.5,-2])
        cylinder(d=4, h=5);
    }
}

module Spurhalter() {
    $fn=100;
    rotate([0,0,90])
    difference() {
        cylinder(d=340,h=4.5);
        translate([0,0,-0.5])
        cylinder(d=338,h=6);
        translate([-175,-183,-0.5])
        cube([350,350,6]);
    }
}
    