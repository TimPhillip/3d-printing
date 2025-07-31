//  Nummer


module Nummer ()
{
    translate([12.5,0,0])
    linear_extrude(8)
    text("60",size=60, font="Bauhaus 93");
    translate([57,0,5])
    rotate([90,0,0])
    cylinder(d=115,h=8, $fn=60);
}

Nummer();