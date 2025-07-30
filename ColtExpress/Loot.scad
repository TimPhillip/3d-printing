// Loot

    
module sack() {
    union(){
        import ("D:/Programme/OpenSCAD/Things/ColtExpress/250.stl");
        rotate([90,0,0])
        translate([-1.5,1.8,-2.3])
        cylinder(d=13.8, h=3.2, center=true);
    }
}

module diamond() {
    union(){
        import ("D:/Programme/OpenSCAD/Things/ColtExpress/Diamond.stl");
        rotate([90,0,0])
        translate([0,0,-1.6])
        cylinder(d=15.5, h=3.2, center=true);
    }
}

module koffer() {
    union(){
        import ("D:/Programme/OpenSCAD/Things/ColtExpress/Strongboxe_Token.stl");
        rotate([90,0,0])
        translate([0,0,-4.5])
        cube([18,7,3], center=true);
    }
}


difference () {
    sack();
    rotate([90,0,0])
    translate([-8,-2,-2.4]) {
    linear_extrude(height=14.3)
    text("  0 ", size = 6.0);}
}


/*
difference () {
    diamond();
    rotate([90,0,0])
    translate([-5,-3,-2.4]) {
    linear_extrude(height=14.3)
    text("$5", size = 6.5);}
}
*/

/*
difference () {
    koffer();
    rotate([-90,0,0])
    translate([-7.5,-3,2.4]) {
    linear_extrude(height=4.3)
    text("$10", size = 6.5);}
}

*/


/*
difference () {
    scale([1,1.5,1])
    sack();
    rotate([90,0,0])
    translate([-7,-0.5,-2.4]) {
    linear_extrude(height=14.3)
    text("200", size = 4.5);}
}
*/