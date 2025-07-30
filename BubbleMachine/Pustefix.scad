// Puste Fix
// ==========
pustefix();

module pustefix() {

    difference() {
        scale([4.0,3.0,1.0]) sphere(r=10);
        scale([3.0,2.0,2.0]) sphere(r=10);
    }

    for (i=[0,1,2,3,4]){
        rotate([0,90,i*40])
        translate([0,30,0])
        cylinder(d=30,h=5, center=true);
        rotate([0,90,-i*40])
        translate([0,30,0])
        cylinder(d=30,h=5, center=true);
    }
}