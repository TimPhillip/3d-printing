include <ModuleKatzenklappe.scad>;
$fn = 40;

// Maße der Mittelachse
mittelAchseLaenge       = 30;
mittelAchseRadius       = 4;
mittelAchseZapfenBreite = 3;
mittelAchseZapfenLaenge = 3;
mittelAchseRadBreite    = 5;


rotate([0,90,0])
rotate([0,0,30])
mittelAchse(laenge = mittelAchseLaenge, radius_achse = mittelAchseRadius, zapfen_breite = mittelAchseZapfenBreite, zapfen_laenge = mittelAchseZapfenLaenge, breite = mittelAchseRadBreite);
