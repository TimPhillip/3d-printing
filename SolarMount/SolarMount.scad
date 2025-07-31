// Solar Mount

/* [Parts] */
Rail = true;
Nut = true;
Clamp = true;


// --------------------------


module Rail() {
    L= 80;
    W = 3;
    
    difference() {
    
        union() {
            translate([-17,0,12])
            cube([16,L,W],center=true);
            
            translate([17,0,12])
            cube([16,L,W],center=true);
            
            translate([-17,0,8])
            cube([W,L,6],center=true);
            
            translate([17,0,8])
            cube([W,L,6],center=true);
            
            translate([-15.5,0,5])
            cube([6,L,W],center=true);
            
            translate([15.5,0,5])
            cube([6,L,W],center=true);
            
            translate([-14,0,-1])
            cube([W,L,11],center=true);
            
            translate([14,0,-1])
            cube([W,L,11],center=true);
            
            translate([-11,0,-8.5])
            rotate([0,-45,0])
            cube([W,L,11],center=true);
            
            translate([11,0,-8.5])
            rotate([0,-135,0])
            cube([W,L,11],center=true);
            
            translate([0,0,-12])
            cube([18,L,W],center=true);    
        }
        translate([0,-30,0])
        cylinder(d=4,h=50,center=true,$fn=40);
        translate([0,30,0])
        cylinder(d=4,h=50,center=true,$fn=40);
    }
    
}

module Nut() {
    
    difference() {
    
        translate([0,0,0])
        cube([30,40,20],center=true);

        translate([-32,0,-3])
        cube([40,50,20],center=true);
        
        translate([32,0,-3])
        cube([40,50,20],center=true);
        
        translate([-28,0,-3])
        rotate([0,-135,0])
        cube([40,50,20],center=true);

        translate([28,0,-3])
        rotate([0,-45,0])
        cube([40,50,20],center=true);

        cylinder(d=6,h=50,center=true,$fn=40);
        translate([0,0,-8])
        cylinder(d=10,h=6,center=true,$fn=6);
    }
}

module Clamp() {
    W =5;
    
    difference() {
        union()
        translate([-17,0,35])    
        {
            translate([0,0,0])
            cube([W,40, 35],center=true);
            translate([-7.5,0,17])
            cube([20,40,W],center=true);
            translate([17.5,0,-17])
            cube([40,40,W],center=true);
            translate([35,0,-20])
            cube([W,40,W],center=true);
        }
        translate([0,0,30])
        cylinder(d=6,h=50,center=true,$fn=40);
    }
}

// --------------------------

if (Rail) color("Green")Rail();
    
if (Nut) Nut();
    
if (Clamp) color("Silver") Clamp();
    
