// 20 : 1 Getriebe
// ===============

use <pd-gears.scad>


// Werte für alle Zahnräder
// ------------------------
mm_per_tooth = 9; //all meshing gears need the same mm_per_tooth (and the same pressure_angle)
thickness    = 6;
hole         = 5;
height       = 12;

// Zähne der Zahnräder
n1 = 7;
n2 = 21--------------i';

// Abstand der Zahnräder
d1 =pitch_radius(mm_per_tooth,n1);
d12=pitch_radius(mm_per_tooth,n1) + pitch_radius(mm_per_tooth,n2);

// Zahnrad 1: 5 Zähne
translate([ 0,    0, 0]) 
rotate([0,0, $t*360/n1])
color([1.00,0.75,0.75]) 
gear(mm_per_tooth,n1,thickness,hole);

// Zahnrad 2: 20 Zähne
translate([ 0,    d12, 0]) 
rotate([0,0,-($t+n2/2-0*n1+1/2)*360/n2])
color([1.00,1.00,0.75]) 
gear(mm_per_tooth,n2,thickness,hole);

