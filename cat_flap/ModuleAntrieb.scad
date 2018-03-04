// //////////////////////////////////
// Module für Katzenklappenverschluss
// //////////////////////////////////

include <gears.scad>;

module armHorn (laenge, breite, dicke) {
    difference() {
    union() {
    translate ([0,-breite/2,0])
    cube([laenge,breite,dicke], false);
    translate ([laenge,0,0])
    cylinder(dicke,r=breite/2, false); 
    }
    translate ([laenge*1.0,0,0])
    loch(radius=2,tiefe= dicke + 1);
/*    translate ([laenge*0.6,0,dicke-1])
    letter("Achim");
    translate ([laenge*0.6,0,1])
    rotate([0,180,0])
    letter("Tim");
    translate ([laenge*0.2,0,0])
    loch(radius=2,tiefe= dicke + 1);
*/    }
};

module mittelRad (breite) {
    difference() {
        cylinder(breite,r=12.5, false);
        cylinder(breite,r=2.0, false);
        
/*        translate([0,0,breite])
        gear (
            toothNo = 100, 
            toothWidth = 1, 
            toothHeight  = 2, 
            thickness = breite,
            holeRadius = 5,
            holeSides = 6
        );
        translate ([-25,0,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([25,0,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([0,-25,0])
        loch(radius=5,tiefe=breite + 1);
        translate ([0,25,0])
        loch(radius=5,tiefe=breite + 1);
*/        } 
};

module loch (radius, tiefe) {
        cylinder(tiefe,r=radius, false);   
};

module zapfen (breite,tiefe) {
        cube([breite,breite,tiefe], true);   
};


module lArm(laenge, breite, dicke) {
    difference() {
        union() {
            armHorn(laenge=laenge, breite=breite, dicke=dicke);
            rotate(90) armHorn(laenge=laenge, breite=breite, dicke=dicke);
            cylinder(dicke,r=breite/2, false); 
           }
            translate ([0,0,0])
            zapfen(breite= 3, tiefe = dicke * 2);
        }
};

module mittelAchse(laenge, radius_achse, zapfen_breite, zapfen_laenge, breite) {
    difference() {
        union() {
            translate ([0,0,zapfen_laenge /2])
            zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
            translate ([0,0,zapfen_laenge])
            cylinder(laenge,r = radius_achse, false, $fn=6);
            translate ([0,0,laenge+(1.5*zapfen_laenge)])
            zapfen(breite= zapfen_breite, tiefe=zapfen_laenge);   
        }
        cylinder (laenge+6,r=0.9, false);
    }
};

module achse(laenge_achse,laenge_stift, radius_stift, radius_achse) {
    union(){
        cylinder(laenge_achse,r = radius_achse, false, $fn=6);
        translate([0,0,-laenge_stift])
        cylinder(laenge_stift,r = radius_stift, false);
        translate([0,0,laenge_achse])
        cylinder(laenge_stift,r = radius_stift, false);
    }
};

/* Testdruck
stuetzeTop(18);



    mittelAchseRadius       = 4;

difference() {



    // Maße eines L-Arms
    lArmBreite  = 10;
    lArmLaenge  = 21;
    lArmDicke   = 3;

    // Maße der Mittelachse
    mittelAchseLaenge       = 21;
    mittelAchseRadius       = 4;
    mittelAchseZapfenBreite = 2.5;
    mittelAchseZapfenLaenge = 3;
    mittelAchseRadBreite    = 5;


    // Verschlussriegel unten
    lArm(laenge=lArmLaenge,breite=lArmBreite,dicke=lArmDicke);


    gear (number_of_teeth=32,
                circular_pitch=109.8,
                hub_diameter=7,
                bore_diameter=1.8,
                rim_width=2,
                rim_thickness=4,
                gear_thickness=4,
                hub_thickness=4,
                circles=0);
    translate([0,0,-10])
    achse(laenge_achse=28,laenge_stift=4.0, radius_stift=2.75, radius_achse=mittelAchseRadius+0.25);

}

*/


font = "Liberation Sans";


letter_size = 3;
letter_height = 2;


module letter(l) {
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "left", valign = "center", $fn = 16);
  }
}


module sg90() {
	color("blue") difference() {
		union() {
			translate([0,0,22.5/2]) cube([22.5,12.2,22.5], center=true);
			translate([0,0,16.75]) cube([32.2,12.2,2], center=true);

			translate([0,0,22.5-1]) {
				hull() {
					translate([-1,0,0]) cylinder(d=5.5, h=4+1);
					translate([1,0,0]) cylinder(d=5.5, h=4+1);
				}

				translate([5.5,0,0]) cylinder(d=11.6, h=4+1);
			}

		}	

		translate([-32.5/2+2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([-2,0,2]) cube([4,1,2+2], center=true);
		}
		translate([32.5/2-2,0,16.75-2]) {
			cylinder(d=2, h=2+2);
			translate([2,0,2]) cube([4,1,2+2], center=true);
		}
	}
	color("white") translate([5.5,0,22.5-1+4]) {
		difference() {
			cylinder(d=4.8, h=3+1);
			translate([0,0,1]) cylinder(d=2, h=4);
		}
	}
}

module stuetze (hoehe) {
    difference() {
        translate ([0,0,0])
        cube([hoehe,20,3], false);
        translate ([hoehe,10,0])
        cylinder(21,r=3.5, center=true);
/*
        translate ([hoehe,5,1.5])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);

        translate ([hoehe,15,1.5])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);
*/
    }
}

module stuetzeTop (hoehe) {
    difference() {
        translate ([0,0,0])
        cube([hoehe,20,3], false);
        translate ([0,10,0])
        cylinder(21,r=3.5, center=true);
/*         
        translate ([hoehe,5,1.5])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);

        translate ([hoehe,15,1.5])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);
*/
    } 


}

module balken (laenge) {
    difference() {
        translate ([0,-10,0])
        cube([5,laenge,3], false);
    }
/*    translate ([2.5,25,2.5])
        rotate([-90,90,0])
        letter("Design by Achim & Tim 2018");    
*/
}

module boden(laenge, breite) {
    difference() {
        Bodendicke = 2;
        cube([Bodendicke,laenge,breite], false);

        // Löcher in Bodenplatte
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.1,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.5,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
        rotate([0,90,0])
        translate ([-breite/2,laenge*0.9,0])
        cylinder(Bodendicke+1,r=1.5, center=false);
        
        // Schlitz in der Bodenplatte
        translate ([1,breite/2+10,11.5])
        cube([1,20,8], false);
/*        
        rotate([0,90,0])
        rotate([0,0,90])
        translate ([10,25,0.5])
        letter("Design Achim & Tim 2018");
*/
    }
    
}

module wand(hoehe, anzahl, abstand) {
    for (a =[0:abstand:anzahl*abstand])
        translate ([0,a,0])
        stuetze(hoehe);
}

module halterung(hoehe) {
    // Bodenplatte
    Bodendicke = 2;
    cube([Bodendicke,22,36],false);
    difference(){
        // Motorhalterung
        translate ([0,0,1.5])
        cube([hoehe,22,15.5],false);
        translate ([0,0,1.5])
        cube([hoehe,1,15.5],false);
        translate ([8,10,11])
        cylinder(6,r=0.5, center=false);
/*
        // Löcher
        translate ([hoehe,2.25,5])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);
        translate ([hoehe,2.25,15])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);
        translate ([hoehe,20,5])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);
        translate ([hoehe,20,15])
        rotate([90,0,90])
        cylinder(85,r=1, center=true);
*/
   }
}

module halterungOben(hoehe) {
    difference(){
        // Motorhalterung
        translate ([0,0,1.5])
        cube([hoehe,22,15.5],false);
        translate ([0,0,1.5])
        cube([hoehe-3,1,15.5],false);
        translate ([7.0,10,11])
        cylinder(6,r=0.5, center=false);

/*
        translate ([hoehe,2.25,5])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);
        translate ([hoehe,2.25,15])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);
        translate ([hoehe,20,5])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);
        translate ([hoehe,20,15])
        rotate([90,0,90])
        cylinder(55,r=1, center=true);
*/
   }
}