
// Schienen Parameter
spur_breite = 39;
schienen_breite = 4;
schienen_hoehe = 5;

steg_breite = 5;
steg_hoehe = 2;
steg_ueberhang = 4;
steg_abstand = 30;


module verbinder() {
    difference(){
        cylinder(r=5, h=2, $fn=100);
        cylinder(r=2, h=2.5, $fn=100);
        translate([-3,-5,0])
        cube([6,5,2.5]);
    }  

}

module verbinderGross() {
    difference(){
        cylinder(r=8, h=2, $fn=100);
        cylinder(r=5.25, h=2.5, $fn=100);
        translate([-3,3,0])
        cube([6,5,2.5]);
    }  

}

module schiene(laenge, winkel, invertiert = false){
    
    
    if (winkel != 0.0) {
    
        // Berechnung der Kreis Parameter
        PI = 3.1415;
        radius = laenge / abs(winkel) * 360 / 2 / PI;
        
        //    translate([-radius,0,0])
        //    cylinder(r=radius-schienen_breite/2 - spur_breite/2, h = 5, $fn=100);
        
        
        difference() {
        
            // Schiene 1
            union() {
                rotate((winkel < 0) ? [0,0,180] : [0,0,0])
                translate([-radius,0,0])
                rotate_extrude(angle=winkel, $fn=100)
                translate([radius - schienen_breite / 2 - spur_breite / 2,0,0])
                square([schienen_breite,schienen_hoehe]);
            }
        }
    
        if (!invertiert) {
            // Connector 1 hinten
            translate([-radius,0,0])
            rotate([0,0,winkel])
            translate([ radius - spur_breite/2,0,0])  
            verbinderGross();
         
            // Connector 1 vorne
            
            translate([-spur_breite/2 ,0,0])
            verbinder();
        } else {
            // Connector 1 hinten
            translate([-radius,0,0])
            rotate([0,0,winkel])
            translate([ radius - spur_breite/2,0,0])  
            verbinder();
         
            // Connector 1 vorne
            
            translate([-spur_breite/2 ,0,0])
            rotate([0,0,180])
            verbinderGross();
        }
        
        // Schiene 2
        difference() {

            union() {
                rotate((winkel < 0) ? [0,0,180] : [0,0,0])
                translate([-radius,0,0])
                rotate_extrude(angle=winkel, $fn=100)
                translate([radius + spur_breite / 2 - schienen_breite / 2,0,0])
                square([schienen_breite,schienen_hoehe]);
            }
        }
        
        if (!invertiert) {
            // Connector 2 hinten
            translate([-radius,0,0])
            rotate([0,0,winkel])
            translate([ radius + spur_breite/2,0,0])  
            verbinderGross();

            // Connector 2 vorne
            
            translate([spur_breite/2 ,0,0])
            verbinder();
        } else {
            // Connector 2 hinten
            translate([-radius,0,0])
            rotate([0,0,winkel])
            translate([ radius + spur_breite/2,0,0])  
            verbinder();

            // Connector 2 vorne
            
            translate([spur_breite/2 ,0,0])
            rotate([0,0,180])
            verbinderGross();

        }
        
        // Stege
        for(i = [steg_abstand / 2 : steg_abstand : (laenge - steg_abstand / 2)]){
            translate([-radius ,0,steg_hoehe/2])
            rotate([0,0,i/laenge*winkel])
            translate([radius ,0,0])
            cube([spur_breite + 2* steg_ueberhang + schienen_breite, steg_breite, steg_hoehe], center=true);
        }
    }
    else {
        // Gerade Schiene
        translate([spur_breite/2-schienen_breite/2,0,0])
        cube([schienen_breite, laenge, schienen_hoehe]);

        translate([-spur_breite/2-schienen_breite/2,0,0])
        cube([schienen_breite, laenge, schienen_hoehe]);
        
        // Stege
        for(i = [steg_abstand / 2 : steg_abstand : (laenge - steg_abstand / 2)]){
            translate([0,i,steg_hoehe /2])
            cube([spur_breite + 2* steg_ueberhang + schienen_breite, steg_breite, steg_hoehe], center=true);
        }

            // Connector 1 hinten
            translate([-spur_breite/2,laenge,0])  
            verbinderGross();
         
            // Connector 1 vorne
            
            translate([-spur_breite/2,0,0])
            verbinder();

            // Connector 2 hinten
            translate([spur_breite/2,laenge,0])  
            verbinderGross();
         
            // Connector 2 vorne
            
            translate([spur_breite/2,0,0])
            verbinder();
      
    }
        
}


//schiene(150,30);

//schiene(180,0);

schiene(180,30, true);

/*
color("green")
translate([-420/3.1415,-420/3.1415,0])
rotate([0,0,270])
schiene(420/2,90);

*/