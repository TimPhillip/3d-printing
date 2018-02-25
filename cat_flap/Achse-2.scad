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

// Zahnrad 2
translate ([gehaeusehoehe*0.6,35,14])
//rotate([0,0,1/108*360])
gear (number_of_teeth=54,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=2,
			hub_thickness=5,
			circles=6);
