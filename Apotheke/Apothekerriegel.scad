// Apotheker Riegel

riegel = true;

if (riegel) riegel();
    

module riegel() {
    $fn = 60;
    
    difference () {
        translate([0,0,4.5])
        cylinder (d=17,h=9, center=true);
        cylinder (d=5,h=25, center=true);
        translate([0,0,7.5])
        cylinder (d=8,h=3.2, center=true);
    }
    difference () {
        translate([0,0,-2.5])
        cylinder (d=13,h=5, center=true);
        translate([0,0,-3])
        cube([6,6,6],center=true);
    }
    
    translate([3,3,0])
    cube([5,20,3]);
}