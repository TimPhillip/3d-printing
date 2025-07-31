////////////////////////////////////////////
// Parameter
////////////////////////////////////////////

Gesamtlaenge      = 195;
Gesamtbreite      = 85;
Gesamthoehe       = 22;

Fuehrungbreite    = 5;

Klotz             = 25;
Lippebreite       = 5;
Gitterhoehe        = 3;

////////////////////////////////////////////
// Items
////////////////////////////////////////////

Schale = true;
Gitter = true;
Fuehrung = false;
Gittereinschub = true;
tropfschale = false;

if (Schale) Schale();
if (Gitter) Gitter();
if (Fuehrung) Fuehrung();
if (tropfschale) tropfschale();


////////////////////////////////////////////
// Modul Schale
////////////////////////////////////////////
module Schale(){
    difference () {
        Wandstaerke = 1;
        MinkRadius = 2;
        MinkHoehe = 2;
        zentriert = true;
        
        Lx = Gesamtlaenge-2*MinkRadius-2*Klotz;
        Bx = Gesamtbreite-2*MinkRadius-Lippebreite; 
        Hx = Gesamthoehe-MinkHoehe-Gitterhoehe;
        
        $fn=50;
        minkowski() {
            cube([Lx,Bx,Hx], center=zentriert);
            cylinder(r=MinkRadius,h=MinkHoehe,center=zentriert);
         }
         
         //aushöhlen
         translate([0,0,Wandstaerke])
         minkowski(){
            cube([Lx-Wandstaerke,Bx-Wandstaerke,Hx],center=zentriert);
            cylinder(r=MinkRadius,h=MinkHoehe,center=zentriert);
        }
        if (Gittereinschub) GitterEinschub();
    }

    // Führung
    if (Fuehrung) Fuehrung();
}
////////////////////////////////////////////
// Modul Gitter
////////////////////////////////////////////
module Gitter() {

    zentriert = true;

    difference() {
        union() {
            
            // links + rechts
            translate([-Gesamtlaenge/2+Klotz/2,-Lippebreite/2,Gesamthoehe/2])
            cube([Klotz,Gesamtbreite,Gitterhoehe],center=zentriert);
            translate([Gesamtlaenge/2-Klotz/2,-Lippebreite/2,Gesamthoehe/2])
            cube([Klotz,Gesamtbreite,Gitterhoehe],center=zentriert);

            // vorne + mitte + hinten
            translate([0,-Gesamtbreite/2,Gesamthoehe/2])
            cube([Gesamtlaenge-2*Klotz,Lippebreite,Gitterhoehe],center=zentriert);
            translate([0,0,Gesamthoehe/2])
            cube([Gesamtlaenge-2*Klotz,Lippebreite,Gitterhoehe],center=zentriert);
            translate([0,-Lippebreite+Gesamtbreite/2,Gesamthoehe/2])
            cube([Gesamtlaenge-2*Klotz,Lippebreite,Gitterhoehe],center=zentriert);
            
            // Stäbe
            for(i = [-Gesamtlaenge/2+Klotz+8 : 10 : Gesamtlaenge/2-Klotz]) {
                translate([i,-2,Gesamthoehe/2])
                cube([5,Gesamtbreite-1,Gitterhoehe],center=zentriert);
                
                // Nippel hinten
                translate([i,Gesamtbreite/2-4.2,Gesamthoehe/2])
                RastNippel();
                
                // Nippel vorn
                rotate([0,0,180])
                translate([i-1,Gesamtbreite/2-4,Gesamthoehe/2])
                RastNippel();
            }
        }

        if (Fuehrung) Fuehrung();
    }
}
////////////////////////////////////////////
// Modul Führung
////////////////////////////////////////////
module Fuehrung() {
    Wandstaerke = 1;
    zentriert = true;
    
    Lx = Gesamtlaenge/2+Fuehrungbreite/2;
    Bx = Gesamtbreite/2;
    
    // links
    translate([-Lx+Klotz,0,Gesamthoehe/2-Wandstaerke/2])
    cube([Fuehrungbreite,Gesamtbreite-Lippebreite,Wandstaerke],center=zentriert);
    translate([-Lx+Klotz,0,Gesamthoehe/2-Gitterhoehe-Wandstaerke])
    cube([Fuehrungbreite,Gesamtbreite-Lippebreite,Wandstaerke],center=zentriert);
    
    // rechts
    translate([Lx-Klotz,0,Gesamthoehe/2-Wandstaerke/2])
    cube([Fuehrungbreite,Gesamtbreite-Lippebreite,Wandstaerke],center=zentriert);
    translate([Lx-Klotz,0,Gesamthoehe/2-Gitterhoehe-Wandstaerke])
    cube([Fuehrungbreite,Gesamtbreite-Lippebreite,Wandstaerke],center=zentriert);

    // hinten
    translate([0,Bx-Fuehrungbreite,Gesamthoehe/2-Gitterhoehe-Wandstaerke])
    cube([Gesamtlaenge-2*Klotz,Fuehrungbreite,Wandstaerke],center=zentriert);
    
}
////////////////////////////////////////////
// Modul GitterEinschub
////////////////////////////////////////////
module GitterEinschub() {
    zentriert = true;
    Wandstaerke = 1;

    translate([0,Gesamtbreite/2,Gesamthoehe/2-Gitterhoehe/2])
    cube([Gesamtlaenge-2*Klotz-1,10,Gitterhoehe+2],center=zentriert);
    translate([0,-Gesamtbreite/2,Gesamthoehe/2-Gitterhoehe/2])
    cube([Gesamtlaenge-2*Klotz-1,10,Gitterhoehe],center=zentriert);

}

////////////////////////////////////////////
// Modul RastNippel
////////////////////////////////////////////
module RastNippel() {

    Nippelsize = 2;

    hull() {
        cube([Nippelsize,Nippelsize,0.01], center=true);
        translate([0,0.5,-3]) cube([1,1,1], center=true);
    }    
}


module tropfschale() {
    Schale();
    Gitter();
}