// Wassertank

include <Parameter.scad>;

use <Tauchpumpenbox.scad>;

wassertank = false;
tauchpumpenbox = true;

if (wassertank) wassertank();
    

if (tauchpumpenbox) {
    
    translate([69,-65,-51])
    rotate([180,90,0])
    union() {
        tauchpumpe();
        box();
        deckel();
    }
}

module wassertank() {
    color("lightgrey",0.8)
    union() {
        translate([0,-(wandhoehe+fusshoehe)/2,-50])
        difference(){
            cube([hausbreite,wandhoehe+fusshoehe,3*hz],center=true);
            translate([0,2,0])
            cube([hausbreite-2*hw,wandhoehe+fusshoehe+hw,3*hz-2*hw],center=true);
        }
        
        tankhalterung();
       
    }
}


module tankhalterung() {
    
    translate([-hausbreite/2,-20,-10])
    haltestab();

    translate([-hausbreite/2,-80,-10])
    haltestab();
    

    translate([hausbreite/2,-20,-10])
    rotate([0,0,180])
    haltestab();

  
    translate([hausbreite/2,-80,-10])
    rotate([0,0,180])
    haltestab();
    
    gleitschiene();

}


module haltestab() {
    difference() {
        translate([-0.5,0,0])
        cube([5,20,50],center=true);
        translate([1,0,hz/2])
        cube([hd,hz+4,hz+1],center=true);
    }
}


module gleitschiene() {
    translate([hausbreite/2-2*hw-1,-100,-26])
    union() {
        cube([3,80,5]);
        translate([-2.5,0,-10])
        cube([3,80,15]);
    }
    
    translate([hausbreite/2-2*hw-1,-100,-26-54])
    union() {
        cube([3,80,5]);
        translate([-2.5,0,0])
        cube([3,80,15]);
    }
}