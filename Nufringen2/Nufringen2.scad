// Nufringen 2

Silouhette = true;
Kirchendach = true;
Rathausdach = true;

Hafte = true;

module Silouhette()
{
$fn=60;
Skalierung = 2.0;

     scale([Skalierung,Skalierung,1.0])
     linear_extrude(height = 5) {
            scale(0.15)
            import("Silouhette.dxf");
        }
        
}  


module Turmdach()
{
    linear_extrude(height = 1)
    {
        polygon([[0,0],[15,10],[32.5,0],[17,39]]);
    }
}

module Kirchendach1()
{
    linear_extrude(height = 1)
    {
        polygon([[0,0],[32.5,0],[32,22],[13.7,19.6]]);
    }
}

module Kirchendach2()
{
    linear_extrude(height = 1)
    {
        polygon([[0,0],[22.5,0],[26,4],[35,4],[43,34],[12,28]]);
    }
}

module Rathausdach1()
{
    linear_extrude(height = 1)
    {
        polygon([
        [0,0],
        [50,11],
        [80,8],
        [91,24],
        [103,6],
        [113.5,23],
        [124,4],
        [125,4],
        [131.5,20],
        [123,19],
        [115,26],
        [86,30],
        [63,41.5],
        [47,36.5],
        [28,23],
        [22,22],
        [27,9],
        [1,2]]);
    }
}

module Rathausdach2()
{
    linear_extrude(height = 1)
    {
        polygon([
        [1,1],
        [5.5,-11.5],
        [8,-10.7],
        [12,2]]);
    }
}

module Rathausdach3()
{
    linear_extrude(height = 1)
    {
        polygon([
        [1,1],
        [3,-1],
        [44.9,-2.5],
        [36,3.4],
        [35.8,3.2],
        [38,-1]]);
    }
}

module Rathausdach4()
{
    linear_extrude(height = 1)
    {
        polygon([
        [0,0],
        [10.5,13],
        [12.2,13.3],
        [7,4.3],
        [12,1]]);
    }
}

module Hafte()
{
$fn=60;
Skalierung = 2.0;

     scale([Skalierung,Skalierung,1.0])
     linear_extrude(height = 5) {
            scale(0.15)
            import("Hafte.dxf");
        }
      
}

if (Silouhette)
{
    translate([-200,-50,0])
    color("white")
    Silouhette();
}
if (Kirchendach)
{
    translate([68,110,5])
    color("red")
    Turmdach();

    translate([38,49.8,5])
    color("red")
    Kirchendach1();

    translate([88,51,5])
    color("red")
    Kirchendach2();
}

if (Rathausdach)
{
    translate([-164,65,5])
    color("red")
    Rathausdach1();

    translate([-156,82,5])
    color("red")
    Rathausdach2();

    translate([-62,69,5])
    color("red")
    Rathausdach3();

    translate([-173,70.5,5])
    color("red")
    Rathausdach4();
}

if (Hafte)
    translate([-20,-180,0])
    minkowski()
    {
    Hafte();
    sphere();
    }