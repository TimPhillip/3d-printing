// Schubladenführungsrad
$fn = 40;

difference()
{
    union()
    {
        cylinder(d=20.5,h=5.5, center=true);
        translate([0,0,1])
        cylinder(d=10,h=6.5, center=true);
    }
    cylinder(d=3.5,h=40, center=true);
}