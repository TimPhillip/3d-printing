// Liquiddetector



Sensorlaenge = 30;
Sensor();

module Sensor() {
    $fn=30;
    difference(){
        cube ([Sensorlaenge,10,7],center=true);
        rotate([0,90,0])
        cylinder(r=3,h=Sensorlaenge+2, center=true);
    }

//    translate([0,7,0])
//    cube ([Sensorlaenge,5,2],center=true);
}