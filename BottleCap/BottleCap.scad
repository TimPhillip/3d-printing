// BottleCap

color("blue")
rotate([270,0,0])
difference() {
    import("D:/Programme/OpenSCAD/Things/BottleCap/SuperCapv3.stl", convexity=3);
    translate([0,8,0])
    rotate([90,0,0])
    ring();
}    

$fn = 60;

difference() {
    union(){ 
        translate([0,0,-14.5])
        cylinder(d=30, h=5, center=true);
        translate([0,0,-8])
        cylinder(d=10, h=15, center=true);
    }
    translate([0,0,-5])
    cylinder(d=6.5, h=30, center=true);
}
    
module ring(){
    difference() {
        cylinder(d=33, h=20, center=true);
        cylinder(d=30.5, h=20, center=true);
    }
}