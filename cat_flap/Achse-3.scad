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
mittelAchseZapfenBreite = 2.6;
mittelAchseZapfenLaenge = 3;
mittelAchseRadBreite    = 5;

// Zahnrad 3


difference() {
    translate ([0,70,0])
    rotate([0,0,1/56*360])
    gear (number_of_teeth=28,
			circular_pitch=109.8,
            hub_diameter=7,
            bore_diameter=1.8,
			rim_width=2,
			rim_thickness=4,
			gear_thickness=4,
			hub_thickness=4,
			circles=0);
    translate ([0,70,-10])
    scale (1.01) mittelAchse(laenge = mittelAchseLaenge, radius_achse =     mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
    translate ([0,70,-10])
    cylinder(20,r=2,true);
}


/*
// Verschluss
translate([gehaeusehoehe*0.7,10,0])


// Verschlussriegel unten
lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

translate([0,0,0])
// Mittelachse
mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
    
// Verschlussriegel oben
//        translate ([0,0,mittelAchseLaenge+lArmDicke])
rotate(-90) lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);

translate ([70,70,3.3])
rotate([0,-90,0]) 
rotate([0,0,30]) 
achse(laenge = 10, radius_achse = mittelAchseRadius);

*/