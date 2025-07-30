// FlowerStand


plate = true;
foot = true;


module plate ()
{
    cylinder(d=75,3,true);
}


module foot()
{
    for (i=[0:2])
    {
        rotate([0,0,i*120])
        translate([25,0,5])
        hull(){
            sphere(4, $fa=5, $fs=0.1); 
            translate([15,0,50])
            sphere(4, $fa=5, $fs=0.1); 
        }
    }
}

$fn = 90;
if (plate) plate();
if (foot) foot();