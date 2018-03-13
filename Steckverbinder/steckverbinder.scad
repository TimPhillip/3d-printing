module steckverbinder(rampe = true) {
    $fn = 10;
    translate([4,1,0.5])
    difference() {
        union() {
            cube([8,2,1], center=true);
            rotate([90,0,0])
            translate([4,0,0])
            cylinder(r=1.0, h=2, center=true);
        }
        
        translate([5,0,-2])
        cube([9,2,3], center=true);
    }
    
    if (rampe){
        hull(){
            translate([0,0,0.5])
            cube([0.5,2,0.5]);
            translate([6,0,0.5])
            cube([0.5,2,0.5]);
            translate([0,0,1])
            cube([0.5,2,0.5]);
        };
    }
}

//steckverbinder();