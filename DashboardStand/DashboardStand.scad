

module outer_stand(){
    difference(){
        hull(){
            cylinder(r=50, $fn=40);

            translate([-50, -50, 0])
            rotate([0, 20,0])
            cube([10, 100, 100]);

            translate([40, -20, 0])
            rotate([0, 0,0])
            cube([10, 40, 20]);
        }
        
        translate([0,0, -10])
        cube([200, 200, 20], center=true);
    }
}

difference(){
    outer_stand();
    translate([0,0,-20])
    scale([0.65,0.65, 1])
    outer_stand();
    
    // USB
    translate([50,0,10])
    cube([100, 15.5, 6], center=true);
    
    // Cable
    hull(){
    translate([-50, 0, 70])
    rotate([0, 110,0])
    cylinder(r=20, h=44);
   
    translate([-50, 0, 0])
    rotate([0, 110,0])
    cylinder(r=20, h=44);
    }
    
    // Mount
    translate([-50, -35, 90])
    rotate([0, 110,0])
    cylinder(r=1.5, h=60, $fn=15);
    
    translate([-50, -35, 60])
    rotate([0, 110,0])
    cylinder(r=1.5, h=60, $fn=15);
    
    translate([-50, 35, 90])
    rotate([0, 110,0])
    cylinder(r=1.5, h=60, $fn=15);
    
    translate([-50, 35, 60])
    rotate([0, 110,0])
    cylinder(r=1.5, h=60, $fn=15);
}