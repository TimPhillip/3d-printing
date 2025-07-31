// Nufringen

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
translate([270,-50,0])
Silouhette();