//Tenda Gehäuse

Hohe = 40;
Breite = 110;
Tiefe = 110;

Tenda = false;
Oben = false;
Unten = true;

module Loch1() {
    $fn=50;
    cylinder(d=11.0,h=8,center=true);
    cylinder(d=6,h=22,center=true);  
}

module Loch2() {
    $fn=50;
    cylinder(d=6.0,h=8,center=true);
    cylinder(d=4,h=52,center=true);  
}


module Tenda() {
    color ("red")
    cube([101,101,27],center=true);
    
}


if (Tenda) Tenda();


module Unten() {
    translate([0,0,-27/4])
    difference() {
    
        translate([0,0,-6])
        minkowski()
        {
          cube([Breite,Tiefe,Hohe/2], center=true);
          sphere(r=2);
            
        }
        
        translate([0,0,27/4])
        Tenda();
        translate([-45,-45,-10]) Loch1();
        translate([-45, 45,-10]) Loch1();
        translate([ 45,-45,-10]) Loch1();
        translate([ 45, 45,-10]) Loch1();
        
        translate([30,5,11])
        cube([80,85,35], center=true);
    }
}



module Oben() {
    translate([0,0,27/4])
    difference() {
    
        translate([0,0,2])
        minkowski()
        {
          cube([Breite,Tiefe,Hohe/2],center=true);
          sphere(r=2);
            
        }
        
        translate([0,0,-27/4])
        Tenda();
        translate([-53,-53,10]) Loch2();
        translate([-53, 53,10]) Loch2();
        translate([ 53,-53,10]) Loch2();
        translate([ 53, 53,10]) Loch2();
        
        translate([30,5,-3])
        cube([80,85,27/2], center=true);
    }


} 

if (Oben) Oben();
if (Unten) Unten();
