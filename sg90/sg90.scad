module sg90() {
    
    servoBreite = 22.5;
    servoHoehe = 22.5;
    servoDicke = 12.5;
    
    halterungBreite = 32.2;
    halterungHoehe = 2.5;
    
    halterungBodenabstand = 16.0 + halterungHoehe/2;
    
	color("blue") difference() {
		union() {
            // Hauptkörper
			translate([0,0,servoHoehe/2]) cube([servoBreite,servoDicke,servoHoehe], center=true);
            // Halterung
			translate([0,0,halterungBodenabstand]) cube([halterungBreite,servoDicke,halterungHoehe], center=true);

            // Kopfrundung
			translate([0,0,servoHoehe-1]) {
				hull() {
					translate([-1,0,0]) cylinder(d=5.5, h=4+1);
					translate([1,0,0]) cylinder(d=5.5, h=4+1);
				}

				translate([5.5,0,0]) cylinder(d=11.6, h=4+1);
			}
		}	

        // Befestigungsloch 
		translate([-halterungBreite/2+2,0,halterungBodenabstand-2]) {
			cylinder(d=2, h=2+2);
			translate([-2,0,2]) cube([4,1,2+2], center=true);
		}

        // Befestigungsloch 
		translate([halterungBreite/2-2,0,halterungBodenabstand-2]) {
			cylinder(d=2, h=2+2);
			translate([2,0,2]) cube([4,1,2+2], center=true);
		}
	}

    // Antrieb 
	color("white") translate([5.5,0,servoHoehe-1+4]) {
		difference() {
			cylinder(d=4.9, h=3+1);
			translate([0,0,1]) cylinder(d=2, h=4);
		}
	}
}

//sg90();