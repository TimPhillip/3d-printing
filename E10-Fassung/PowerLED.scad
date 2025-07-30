// Power LED Gehäuse

Oben = true;
Unten = true;


if (Oben) Oben();
if (Unten) color("Lightblue") Unten();
    


module Oben()
{ 
    difference()
    {
        cube([160,16,14],center=true);
        translate([0,0,0])
        cube([162,13,11],center=true);
        translate([0,0,-6])
        cube([162,8,4],center=true);
        rotate([90,0,0])
        translate([0,0,5])
        cylinder(d=4,h=10,center=true, $fn=40);
    }
}

module Unten()
{ 
    difference()
    {
        translate([0,0,-1])
        cube([160,12,12],center=true);
        translate([0,-5,-6.5])
        cube([162,3,3],center=true);
        translate([0,5,-6.5])
        cube([162,3,3],center=true);
        translate([0,0,1])
        cube([162,10,10],center=true);
    
        rotate([90,0,0])
        translate([0,0,5])
        cylinder(d=4,h=10,center=true, $fn=40);
    }
}