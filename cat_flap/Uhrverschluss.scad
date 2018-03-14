  
difference() {
    union(){
        translate([2,2,2])
        minkowski(){
            //29,21,6
            cube([25,17,2]);
            sphere(r=2,center=true);
        }
    }
    
    translate([4.5,1,0])
    cube([20,19,6]);

    translate([0,1,0])
    cube([29,19,4]);

    translate([14,0,2.5])
    rotate([-90,0,0])
    cylinder(1,r=0.5,false);

    translate([14,20,2.5])
    rotate([-90,0,0])
    cylinder(1,r=0.5,false);

    translate([7,0,-3])
    rotate([-90,0,0])
    cylinder(30,r=5.5,false);

    translate([27,0,-17])
    rotate([-90,0,0])
    cylinder(30,r=20.5,false);

    translate([25.5,10.5,5.5])
    cube([2.5,2,1],center= true);
}