// Instax Bilderrahmen

//rotate([0,-15-90,0])
union() {
    difference(){

    cube([88,57,3.25],center=true);

    translate([0,0,0])
    cube([90,55.5,1.5],center=true);

    translate([0,0,1.4])
    cube([90,50,1.5],center=true);

    translate([-13.5+18,0,-1.4])
    cube([61,45,1.5],center=true);

    }

    difference() {
        translate([-42.4,0,8.0])
        rotate([0,15,0])
        cube([2,57,22],center=true);

        translate([0,0,-2.38])
        cube([100,58,1.5],center=true);
    }

}