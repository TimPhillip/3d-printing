// Cocktailmaker Schlauchdurchlass

$fn = 80;



difference() {

    cylinder(d=7, h=6, center=true);
    cylinder(d=5.6, h=7, center=true);
}
translate([0,0,-2.5])
difference() {

    cylinder(d=12, h=1, center=true);
    cylinder(d=5.6, h=7, center=true);
}
