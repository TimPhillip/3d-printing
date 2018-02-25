
include <ModuleKatzenklappe.scad>;
include <gears.scad>;

zahnradabstand = 25;
gehaeusehoehe = 45;


//rotate ([0,-90,0])
union() {

    translate ([0,0,0])
    wand(gehaeusehoehe,2,zahnradabstand);
    translate ([0,0,3])
    boden(zahnradabstand*2+20,30);
    translate ([0,0,33])
    wand(gehaeusehoehe,2,zahnradabstand);
    difference() {
        translate ([0,zahnradabstand*2+20,0])
        halterung(gehaeusehoehe);
        translate ([25,80,0])
        scale(1.01) sg90();
    }
// Servo
//       translate ([25,80,0])
//       scale(1.01) sg90();
}
 
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
// Zahnrad 1.1
translate ([gehaeusehoehe*0.6,60,28])
gear (number_of_teeth=26,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=4,
			hub_thickness=4,
			circles=0);

// Zahnrad 1.2
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
achse(laenge=25, radius_achse=mittelAchseRadius);


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

// Zahnrad 3
translate ([gehaeusehoehe*0.7,10,14])
rotate([0,0,1/56*360])
gear (number_of_teeth=28,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=2,
			hub_thickness=5,
			circles=6);


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

// Verschluss
translate([gehaeusehoehe*0.7,10,4.5])
union() {

        // Verschlussriegel unten
        lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

        translate([0,0,0])
        // Mittelachse
        mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
            
        // Verschlussriegel oben
        translate ([0,0,mittelAchseLaenge+lArmDicke])
        rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);
}