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


difference() {
    // Zahnrad 0
    translate ([30.5,80,28])
    rotate([0,0,1/82*360])
    gear (number_of_teeth=41,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=2,
                hub_thickness=3,
                circles=0);
    // Servo
           translate ([25,80,0])
           scale(1.01) sg90();
}