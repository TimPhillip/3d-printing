// Notaus
a= 45;
b= 45;
c= 50;

w = 2;

module Outer() {
    
    cube([a,b,c],center=true);
}



module Inner() {
    
    cube([a-w,b-w,c-w],center=true);
}


module box() {
    difference(){
        Outer();
        translate([0,0,w])
        Inner();
        
        rotate([0,90,0])
        translate([15,0,20])
        cylinder(d=6, h=10, center=true, $fn=40);
    }
}

module Deckel() {
    difference() {
        scale([1.2,1.2,1.0])
        Outer();
        translate([0,0,-w])
        scale([1.1,1.1,1.0])
        Outer();
        
        translate([0,0,-5])
        scale([2,2,1.0])
        Outer();
        
        
        translate([0,0,10])
        cylinder(d=23, h=40, center=true, $fn=40);
    }
}

box();
//translate([0,0,10])
//Deckel();