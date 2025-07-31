//Lüfter 12V Turbine 98x34

/* [Parameter] */
W = 98;
H = 34;

module body()
{
    $fn=50;
    cylinder(d=W-1,h=H,center=true);
    translate([0,-W/4,0])
    cylinder(d=W/2,h=H,center=true);
    translate([0,0,-2])
    cylinder(d=33,h=H,center=true, $fn=40);
}

module Lufter() 
{
    body();
    Auslass();
    rotate([0,0,-315])
    translate([0,-W/2-4,0])
    Befestigung();
    rotate([0,0,225])
    translate([0,-W/2-4,0])
    Befestigung();
}

module Auslass()
{
    translate([-W/4,-W/4,0])
    cube([W/2+3,W/2,H],center=true);
    Befestigung();
}

module Befestigung()
{
    $fn=50;
    difference()
    {
        union() 
        {
            cylinder(d=7,h=H,center=true);
            translate([0,4,0])
            cube([7,7,H],center=true);
        }
        cylinder(d=4.6,h=H+2,center=true);
    }

}
        
Lufter();