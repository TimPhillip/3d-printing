// Schubbox

module Box (){
    difference(){
        cube([140,54.5,36.8],center=true);
        translate([0,0,1.5])
        cube([137,51.5,36.8],center=true);
    };
};
    
    
module Griff() {
    difference(){
        cube([9,38,9.5],center=true);
        translate([0.5,0,3])
        cube([7,35,4],center=true);
        translate([0.5,0,-3])
        cube([7,35,4],center=true);
        rotate([0,90,0])
        translate([-13.5,0,-4])
        cylinder(d=25,h=3,center=true);
        rotate([0,90,0])
        translate([13.5,0,-4])
        cylinder(d=25,h=3,center=true);
    };
};

module Nase() {
        cube([1.75,39,3],center=true);
};

    
    
    union() {
        Box();
        translate([-74,0,0])
        Griff();
        translate([69.25,0,19.5])
        Nase();
    };
    
    