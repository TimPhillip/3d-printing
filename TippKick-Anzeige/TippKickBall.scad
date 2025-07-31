// Tipp Kick Ball

module Top() {
    rotate([180,0,0])
    translate([0,0,-2.5])
    Side3Base();
}



module TopLevel() {
    rotate([0,0,0]) 
    Top();
}

module Side4Base(){
    difference() {
        cylinder(r=7,h=1, $fn=4);
        cylinder(d=4,h=5, $fn=50, center=true);
    }
    difference() {
        sphere(3, $fn=30);
        sphere(2, $fn=30);
        translate([0,0,5])
        cube([10,10,10], center=true);
    }
}


module Side4(){
    rotate([0,0,45]) 
    translate([-3.0,3.0,3.5])
    Side4Base();
}



module Side3(){
    rotate([0,-110,0]) 
    translate([-5.0,0,-6.0])
    Side3Base();
}

module Side3Base(){
    translate([0,0,-0.6])
    difference() {
        cylinder(r=6, h=1, $fn=3);
        cylinder(d=3,h=5, $fn=50, center=true);
    }
    difference() {
        sphere(2, $fn=30);
        sphere(1, $fn=30);
        translate([0,0,-5.5])
        cube([10,10,10], center=true);
    }
}


module Side3Level() {
    for (i=[0:120:360]) {
        rotate([0,0,i]) 
        Side3();
    }
}


module Side4Level() {
    for (i=[0:120:360]) {
        rotate([0,-55,i]) 
        Side4();
    }
}

module Halbball() {
    translate([0,0,5.0]){
        TopLevel();
        Side3Level();
        Side4Level();
    }
}

module Ball(){
    color("Yellow")
    Halbball();
    color("White")
    rotate([0,180,0])
    Halbball();
}

Ball();
