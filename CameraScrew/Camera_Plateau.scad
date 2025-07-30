// Webcam Plateau

module Mount(){
    translate([-10,68,-10])
    import("Camera_Mount_to_frame.stl");
}

module Screw(){
    translate([0,0,-7])
    import("camera_screw.stl");
}


module Extender(){
    rotate([0,0,180])
    translate([12.5,-104,2])
    import("raspberry_camera_extender.stl");
}


module Plateau() {
    translate([0,0,12])
    
    difference(){
        cube([40,40,4],center=true);
        cylinder(d=7,h=7,center=true,$fn=30);
    }

    difference(){
        translate([0,14,-2.5])
        rotate([-90,0,0])
        rotate([0,-90,0])
        translate([0,-15,-1.5])
        hull(){
            cylinder(d=5,h=10,center=true,$fn=30);
            translate([15,0,0])
            cylinder(d=5,h=10,center=true,$fn=30);
        }
        rotate([0,90,0])
        translate([-12.5,28.5,0])
        cylinder(d=3,h=20,center=true,$fn=30);
   }
}

/*
Mount();
Screw();
Extender();
*/

translate([0,0,-7])
Plateau();