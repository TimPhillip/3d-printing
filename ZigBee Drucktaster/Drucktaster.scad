$fn=32;


difference(){
linear_extrude(2)
minkowski(){
circle(r=3);
square([34, 34], center=true);
}

linear_extrude(4)
minkowski(){
circle(r=1);
square([10, 10], center=true);
}

translate([-17,-17, -1])
cylinder(d=2, h=10);

translate([17,-17, -1])
cylinder(d=2, h=10);

translate([17,17, -1])
cylinder(d=2, h=10);

translate([-17,17, -1])
cylinder(d=2, h=10);
}