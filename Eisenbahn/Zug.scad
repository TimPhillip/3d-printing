// Zug
//

use <Eisenbahn.scad>

rad=true;
schiene = true;
aufhangung = true;
rad_aufhang= false;
motor = false;
achse = false;
achsen_verschluss = false;
wagon_achse = false;
wagon = false;

antrieb=false;
doppelantrieb = false;

zug = false;

/* [Eisenbahnrad] */
// [Radhöhe]
rh = 4;         
// [Steghöhe]
sh = 1;
// [Raddurchmesser]
rd = 30;
// [Stegdurchmesser]
sd = 34;

/* [Eisenbahnschiene] */
// [Schienenlänge]
sl = 150;
// [Schienenweite]
sw = 35;
// [Schienenstegabstand]
ssa = 30;
// [Stegbreite]
sb = sw+20;

/* [Lokaufhängung] */
// [Aufhängungslänge]
ahl = 45;         




if (doppelantrieb) {
    
    if (motor) translate([25,0,0]) motor();
    if (achse) translate([-35,0,0]) achse();
    if (wagon_achse) translate([0,0,20]) wagon_achse();
    if (rad_aufhang) translate([0,0,20]) rad_aufhang();

    union(){
        if (rad) {
            translate([0,-35/2+1,0])
            rotate([90,0,0]) rad();
            translate([0,35/2-1,0])
            rotate([-90,0,0]) rad();
            
            translate([-35,35/2-1,0])
            rotate([-90,0,0]) rad();
            translate([-35,-35/2+1,0])
            rotate([90,0,0]) rad();
        }
    }
}
