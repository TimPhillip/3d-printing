// Massstab-Klammmer


$fn=30;
translate([0,0,-2.5])
cylinder(d=6,h=0.7,center=true);



difference() {
    $fn=30;
    cylinder(d=4.5,h=5.5,center=true);
    translate([0,0,1.3])
    rotate([90,0,0]) 
    cylinder(d=1.1,h=5, center=true);
}