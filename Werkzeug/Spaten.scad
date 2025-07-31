// Spaten



Rechen = true;
Spaten = true;
Hacke = true;


if (Rechen) {
    scale([0.3,0.3,0.3])
    rotate([0,0,90])
    import("rake.stl");
    
    translate([40,0,3])
    rotate([30,0,0])
    rotate([0,90,0])
    cylinder(d=7.0, h=50, $fn=6);
    
    
    translate([-20,0,2])
    rotate([0,90,0])
    cylinder(d=4,h=80, $fn=60);
    
    translate([-14.5,0,3])
    rotate([0,90,0])
    cylinder(d=6,h=60, $fn=60);
}

if (Spaten) {

    $fn=6;
    import("Spaten.stl");
    
    translate([41,0,2])
    rotate([30,0,0])
    rotate([0,90,0])
    cylinder(d=7.0, h=50);

    translate([3,0,2])
    rotate([0,90,0])
    cylinder(d=6,h=40, $fn=60);

}

if (Hacke) {
    
    scale([0.3,0.3,0.3])
    translate([0,153,76])
    rotate([90,180,90])
    union(){
        include <Hacke.scad>;
    }
    translate([41,0,2])
    rotate([30,0,0])
    rotate([0,90,0])
    cylinder(d=7.0, h=50, $fn=6);

    translate([0,0,2])
    rotate([0,90,0])
    cylinder(d=7,h=45, $fn=60);
}