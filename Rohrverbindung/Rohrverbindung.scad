include <D:\Dokumente\GitHub\3d-printing\Steckverbinder\steckverbinder.scad>;



difference() {
    cylinder(r=10, h=10);
    cylinder(r=8, h=10);

}


module verbindung() {
    for (ball = [0:90:360] ) {
        rotate([0,-90,ball])
        translate([0,0,7])
        steckverbinder(rampe = true);
    }
}

translate([0,0,7.5])
verbindung();

translate([0,0,-10])
difference() {
    union () {
        translate([30,0,10])
        difference() {
            cylinder(r=10, h=10);
            cylinder(r=8, h=10);

        }
    }
    translate([30,0,7.5])
    scale(1.02) verbindung(rampe = true);
}