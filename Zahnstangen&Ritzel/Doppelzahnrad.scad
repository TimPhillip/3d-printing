// Doppelzahnrad

module Z24() 
{
    import("Zahnrad-24.stl");
}

module Z8() 
{
    import("Zahnrad-8.stl");
}

module Verbinder() 
{
    $fn=30;
    difference()
    {
        translate([0,0,0])
        cylinder(d=20,h=5);
        translate([0,0,-0.5])
        cylinder(d=1.9,h=12);
        
    }
}


module Doppelrad() 
{
    rotate([0,0,0])
    translate([0,-24,0])
    Z24();
    Verbinder();
    translate([0,-8,5])
    Z8();
}

Doppelrad();