// Hallo Halloween

Netz = true;
Spinne1 = true;
Spinne2 = true;
Kuerbis = true;
Kuerbis2 = true;
Hallo = true;
Hall = true;
Ween = true;

module Netz()
{
 $fn=60;

    difference()
    {
        translate([0,-29,0])
        scale([Skalierung,Skalierung,1.0])
        linear_extrude(height = 10) {
                scale(0.15)
                import("Spinnennetz.dxf");
        } 

//        translate([1,0,0])
//        cube([195,5,10]);
    }
}   


module Spinne()
{
 $fn=60;


 scale([Skalierung,Skalierung,1.0])
 linear_extrude(height = 5) {
        scale(0.15)
        import("Spinne.dxf");
    }
    
}  


 

module Kuerbis()
{
 $fn=60;


 scale([Skalierung,Skalierung,3.0])
 linear_extrude(height = 5) {
        scale(0.15)
        import("Kuerbis.dxf");
    }
    
}   
module Hallo()
{
 $fn=60;


 scale([Skalierung-1.5,Skalierung-1.5,2.0])
 linear_extrude(height = 5) {
        scale(0.15)
        import("Hallo.dxf");
    }
    
}   
 module Hall()
{
 $fn=60;


 scale([Skalierung,Skalierung,2.0])
 linear_extrude(height = 5) {
        scale(0.15)
        import("Hall.dxf");
    }
    
}   

module Ween()
{
 $fn=60;


 scale([Skalierung,Skalierung,2.0])
 linear_extrude(height = 5) {
        scale(0.15)
        import("Ween.dxf");
    }
    
}   
   
module Ballon()
{
        import("BallonLED.stl", convexity = 5);
}

module Loch()
{
    hull()
    {
        translate([29,23,-1])
        cylinder(d=11,h=3);
        translate([29,23,10])
        cylinder(d=17,h=3);
    }
}

Skalierung = 4.1;


if (Netz) 
color("white")
Netz();


if (Spinne1)
translate([30,30,9.5])
color("black")
Spinne();

if (Spinne2)
translate([140,40,9.5])
rotate([0,0,-45])
color("black")
Spinne();


if (Kuerbis)
color("orange")
translate([70,-7,9.5])
Kuerbis();

if (Hallo)
color("red")
translate([18,15,9.5])
Hallo();

if (Hall)
color("red")
translate([15,10,9.5])
Hall();

if (Ween)
color("red")
translate([119,15,9.5])
Ween();


if (Kuerbis2)
{
    union(){
    translate([-50,0,0])
    color("violet")
    
    difference()
    {
        Kuerbis();
        cube([50,70,5]);
    }
    }
}
