// PI3 Case mit Ein-/Ausschalter


Top = true;
Bottom = true;
Turm = true;

module Top()
{
    rotate([180,00,90])
    translate([0,-63,-24])
    import("Top.stl");
}

module Bottom()
{
    translate([10,13,0])
    import("Bottom.stl");
}


module Turm()
{
    difference()
    {
        union()
        {
            translate([2,-1.5,8.5])
            scale([1.05,1.05,1])
            intersection()
            {
                Top();
                translate([-54.75,64,20])
                cube([56,24,10]);
            }

            translate([-56.25,64,24.5])
            minkowski()
            {
                difference()
                {
                    cube([60,28,7]);
                    translate([0.75,1,0])
                    cube([59,26,8]);
                }
                sphere();
            }
        }
        translate([-51,92,20])
        cylinder(r=3.5,h=20,$fn=30);
        translate([-1,92,20])
        cylinder(r=3.5,h=20,$fn=30);
        translate([-26.5,73.5,20])
        cylinder(r=4,h=20,$fn=30);
        translate([-26.5,85,20])
        cylinder(r=3,h=20,$fn=30);
    }
}

if (Top) 
{
        union()
        {

            difference()
            {
                Top();
                translate([-55,65.5,20])
                cube([58,24,10]);
            }
        }
}
if (Bottom) Bottom();
    
if (Turm) Turm();
