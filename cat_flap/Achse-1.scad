include <ModuleKatzenklappe.scad>;
include <gears.scad>;

zahnradabstand = 25;
gehaeusehoehe = 45;

// Maße eines L-Arms
lArmBreite  = 10;
lArmLaenge  = 18;
lArmDicke   = 3;

// Maße der Mittelachse
mittelAchseLaenge       = 21;
mittelAchseRadius       = 4;
mittelAchseZapfenBreite = 2.5;
mittelAchseZapfenLaenge = 3;
mittelAchseRadBreite    = 5;

// Zahnrad 1.1
/*translate ([gehaeusehoehe*0.6,60,28])
gear (number_of_teeth=26,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=4,
			hub_thickness=4,
			circles=0);*/

// Zahnrad 1.2
difference(){
translate ([gehaeusehoehe*0.6,60,14])
gear (number_of_teeth=28,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=4,
			hub_thickness=4,
			circles=0);

translate ([gehaeusehoehe*0.6,60,4])
scale(1.01)
achse(laenge=25, radius_achse=mittelAchseRadius);}

