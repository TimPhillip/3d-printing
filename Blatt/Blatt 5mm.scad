// Blatt

    $fn = 30;

module Emblem() {
    translate([-6.3,11,0])
    scale([0.1,0.1,0.3])
        linear_extrude(height=5,center = true, convexity = 10)
        import("Blatt.svg", center = true, dpi = 96);
}


module Oben() {
    translate([0,0,1])
    Emblem();    
    difference() {
        union() {

            cube([10,25,2],center=true);
            rotate([0,90,0])
            translate([0,12,0])
            cylinder(d=8,h=10,center=true);
        }
        rotate([0,90,0])
        translate([0,12,0])
        cylinder(d=5,h=12,center=true);
        
        translate([0,12,0])
        cube([5,8,9],center=true);
    }
}

module Mitte() {
    
        union() {
            difference() {
                translate([0,0,0])
                cube([10,40,2],center=true);
                
                translate([4,-19,0])
                cube([5,10,9],center=true);
                translate([-4,-19,0])
                cube([5,10,9],center=true);

                translate([4,19,0])
                cube([5,10,9],center=true);
                translate([-4,19,0])
                cube([5,10,9],center=true);
            }
            rotate([0,90,0])
            translate([0,-19,0])
            cylinder(d=3,h=17,center=true);
            
            rotate([0,90,0])
            translate([0,-19,8])
            cylinder(d=6,h=2, center=true);
            
            rotate([0,90,0])
            translate([0,-19,-8])
            cylinder(d=6,h=2, center=true);
            
            rotate([0,90,0])
            translate([0,19,0])
            cylinder(d=3,h=17,center=true);
            
            rotate([0,90,0])
            translate([0,19,8])
            cylinder(d=6,h=2, center=true);
            
            rotate([0,90,0])
            translate([0,19,-8])
            cylinder(d=6,h=2, center=true);
            
            
        }
    
}

module Unten() {
    difference() {
        rotate([0,0,180])
        Oben();
        translate([0,-14,-3])
        cube([15,4,4],center=true);
//        translate([0,-12,-2])
//        cube([15,2,2],center=true);
    }
}

// Blatt Teil 1

Oben();
translate([0,31,0])
Mitte();
    

// Blatt Teil 2

translate([0,62,0])
Unten();
