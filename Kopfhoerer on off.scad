// Kopfhoerer on/off
//
w=380;
du=20;

module bogen() {
    translate([0,-w/2])
    difference() {
        circle(d=w,$fn=100);
        translate([0,0,0])
        circle(d=w-du,$fn=100);
        translate([0,-22,0])
        square([w+1,w+1], center=true);
    }
}

difference() {
    linear_extrude(10)
    bogen();
    translate([-70,-18,0])
    cube([10,5,2],center=true);
    translate([70,-18,0])
    cube([10,5,2],center=true);
}