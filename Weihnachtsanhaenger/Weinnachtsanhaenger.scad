//Flocken

Boxhoehe = 50;

Flocke1= true;
Box= false;
Girlande = false;

$fn = 50;

module Box() {
    difference() {
       cylinder(d=58,h=Boxhoehe, center=true);
       translate([0,0,2])
       if (Flocke1) {
//           scale([1.1,1.1,1])Flocke1(Boxhoehe);
           cylinder(d=46,h=Boxhoehe,center=true);
           
           for (i=[0:1:5]) {
               rotate([0,0,30+i*60])
               translate([24,0,0])
               cylinder(d=7,h=Boxhoehe, center=true, $fn=30);
           }
       }
    }
}

module Flocke1(h) {
    translate([-31,-27,0])
    scale([0.2,0.2,1])
    linear_extrude(height = h, center = true, convexity = 10)
    import("Flocke1.dxf");

}

module Girlande() {
    difference() {
        cylinder(d=50,h=5,center=true);
        translate([17,7,0])
        cylinder(d=4,h=6,center=true);
        translate([17,-7,0])
        cylinder(d=4,h=6,center=true);
    }
}

module Main() {
    
    if (Flocke1 && !Box ) Flocke1(1);
    if (Box) {
        translate([0,0,0])Box();
        Box();
    }
    
    if (Girlande) Girlande();

}


Main();

