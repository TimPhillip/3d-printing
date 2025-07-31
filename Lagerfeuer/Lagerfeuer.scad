
// Lagerfeuer

module Lagerfeuer()
{
    $fn = 40;

    translate([3,16,0])
    import ("wood.stl");

 //   translate([0,0,-5])
 //   cylinder(d=28,h=10,center=true);
}

difference()
{
    Lagerfeuer();
    translate([0,0,-13])
    sphere(d=26);
}