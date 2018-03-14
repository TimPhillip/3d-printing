connector = 10;
width = 15;
thick = 4.5;

module arm(){ 
    translate([5,5,0])
    rotate([0,0,90])
     minkowski(){
        cube([18,width - 10,thick]);
        cylinder(r=5,h=1,center=true);
    }

 
    translate([5,5,8])
    rotate([0,0,90])
     minkowski(){
        cube([18,width - 10,thick]);
        cylinder(r=5,h=1,center=true);
    }

    translate([5,5,0])
    rotate([0,0,90])
     minkowski(){
        cube([2,width - 10,12]);
        cylinder(r=5,h=1,center=true);
    }

    translate([5,5,0])
    rotate([0,0,45])
    translate([-80,0,0])
    union(){ 
        minkowski(){
            cube([80,width - 10,thick]);
            cylinder(r=5,h=1,center=true);
        }
        /*translate([0,0,thick])
        cube([80,4,4]);*/
    }

    translate([-40,-87,0])
    rotate([0,0,-65])
    translate([-40,0,0])
    difference(){
         minkowski(){
            cube([80,width - 10,thick]);
            cylinder(r=5,h=1,center=true);
        }
        translate([75,(width-10)/2,0])
        cylinder(h=30,r=1.95,center=true);
        translate([75 - 47,(width-10)/2,0])
        cylinder(h=30,r=1.95,center=true);
    }
}
/*
difference(){
    arm();
    translate([2.5,21,0])
    rotate([0,0,0])
    cylinder(r=1.95,h=30);
}*/

translate([0,-80,0])
union(){
    difference(){
        cube([width,41,7.6]);
        translate([0,2,0])
        cube([width,37,5.6]);
    }
    translate([0,-8,0])
    difference(){
        cube([width,10,2]);
        translate([width/2,5,0])
        cylinder(r=1.95,h=30,center=true);
    }
    translate([0,39,0])
    difference(){
        cube([width,10,2]);
        translate([width/2,5,0])
        cylinder(r=1.95,h=30,center=true);
    }
}