$fn=60;

difference() {
    translate([0,0,39])
    rotate([90,0,0])
    import("D:/Programme/OpenSCAD/Things/Schleifmaschine/Base-3000.stl");

    translate([80,-220,-5])
    cube([90,120,80]);
    
    translate([130,-60,20])
    rotate([90,0,0])
    cylinder(d=3.2,h=60);
    
    translate([110,-60,20])
    rotate([90,0,0])
    cylinder(d=3.2,h=60);
}
    