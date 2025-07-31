// SolarVerteiler


module Outer(){

    minkowski(){
        cube([60,30,20],center=true);
        sphere(r=1);
    }   
}
module Inner() {
    translate([0,0,3])
    cube([56,26,20],center=true);
}


module Hole() {
    translate([0,10,0])
    rotate([90,0,0])
    cylinder(d=8,h=20,center=true,$fn=40);
}

module Deckel() {
    translate([0,0,5])
    difference() {
        Outer();
        translate([0,0,-2])
        cube([62,32,20],center=true);

        translate([27,12,0])
            Loecher();
        translate([-27,12,0])
            Loecher();
        translate([27,-12,0])
            Loecher();
        translate([-27,-12,0])
            Loecher();

    }
}

module Steg() {
    translate([27,12,0])
    difference() {
        Pfosten();
        Loecher();
    }
    translate([-27,12,0])
    difference() {
        Pfosten();
        Loecher();
    }
    translate([27,-12,0])
    difference() {
        Pfosten();
        Loecher();
    }
    translate([-27,-12,0])
    difference() {
        Pfosten();
        Loecher();
    }
}

module Pfosten() {
        cube([5,5,20],center=true);
}
module Loecher() {
        cylinder(d=3,h=30,center=true,$fn=40);
}
module Box() {

    difference() {
        
        Outer();
        Inner();
        translate([18,0,0])
        Hole();
        translate([0,0,0])
        Hole();
        translate([-18,0,0])
        Hole();
        translate([0,-20,0])
        rotate([90,0,0])
        cylinder(d=3,h=50,center=true,$fn=40);
        
        
        translate([-20,0,0])
        cylinder(d=3,h=50,center=true,$fn=40);
        
        translate([20,0,0])
        cylinder(d=3,h=50,center=true,$fn=40);
    }

    Steg();


}

//Box();
Deckel();