module steckverbinder() {
    $fn = 10;
    translate([2.5,1,0.5])
    difference() {
        union() {
            cube([5,2,1], center=true);
            rotate([90,0,0])
            translate([2.5,0,0])
            cylinder(r=2, h=2, center=true);
        }
        
        translate([5,0,-2])
        cube([9,2,3], center=true);
    }
}

//steckverbinder();