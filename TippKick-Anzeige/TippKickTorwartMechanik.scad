// Tipp Kick Torwart Mechanik

Torwart = true;
Achse = true;;
Hornadapter = false;
Box = false;
Box_Front = false;
SG90 = false;
SG90_Mount = false;
Joystick = false;
Joystick_Mount = false;
Joystick_Kappe = false;
Schnitt = false;

module end() {
}

Breite = 80;
Hoehe = 45;
Tiefe = 45;
Wand = 2;

module SG90_imp(){
    import("2051_servo_tower-pro-sg90.pk2.stl", convexity=5);
}

module SG90(){
    color("Gray")
    rotate([180,0,180])
    translate([-10,Hoehe/2-8.25-51,(-Tiefe/2+18.5)])
    SG90_imp();
}

module SG90_Fix(){
    translate([0,-17,16])
    difference() {
        cube([80-4,2,24],center=true);
        translate([10,0,9])
        cube([8,4,6],center=true);             // Kabelschlitz
        for (i=[1,-1])
            for (j=[1,-1])
                rotate([90,0,0])
                translate([i*24,j*8,-2])
                cylinder(d=2,h=5,$fn=40);
    }
}

module Schalter_Schlitz() {
    translate([Breite/2,0,-10])
    union() {
        cube([2,9,4],center=true);
        translate([-2,0,0])
        cube([4,5,2],center=true);
    }
}

module Joystick() {
    color("Green")
    translate([1.5,-Hoehe/2+12+4,0])
    union(){
        cube([31,1,26],center=true);       // Joystickplatine
        translate([-1.5,-7,0])
        cube([22,15,26],center=true);      // Joystickpoti
    }    
}

module Joystick_Kappe() {
    rotate([90,0,0])
    translate([0,10,37.5])
    difference() {
        union(){
            cylinder(d=32,h=1,$fn=60, center=true);
            translate([0,0,1.5])
            cylinder(d=29,h=2,$fn=60, center=true);
            translate([0,0,3])
            cylinder(d=32,h=1,$fn=60, center=true);
            
        }
        cylinder(d=21,h=15,$fn=40, center=true);
    }

}

module Joystick_Hole() {
    rotate([90,0,0])
    translate([0,0,Hoehe/2])
    cylinder(d=30,h=6,$fn=60,center=true);
}

module Joystick_Mount() {
    translate([1.5,-Hoehe/2+9,0])
    difference(){
        union(){
            mount();
            translate([0,4,0])
            cube([38,16,24],center=true);
        }
        
        translate([0,6,0])
        cube([34,2,27],center=true);     // Joystickplatine
        
        translate([0,0,0])
        cube([31,22,30],center=true);

        translate([0,-3,0])
        cube([40,10,30],center=true);      // Kabelschlitz
        
        
        translate([30,0,0])
        cube([20,30,30],center=true);    // Prozessorplatz

        translate([-29,0,0])
        cube([20,30,30],center=true);    // oben Batterieplatz
                
        rotate([0,90,0])
        translate([-22,-24,0])
        cylinder(d=5,h=60,$fn=40, center=true);   // Kabelkanal

        translate([0,-19,15])
        for (i=[1,-1])
            for (j=[1,-1])
                rotate([90,0,0])
                translate([i*30,j*8,-2])
                cylinder(d=2,h=5,$fn=40);   // Schraublöcher

    }
}


module mount() {
    translate([0,0,0])
    cube([Breite-4,15.5,24],center=true);
}

module SG90_Mount(){
    translate([0,Hoehe/2-7.75,Tiefe/2-12-Wand])
    difference() {
        difference() {
            mount();
            scale(1.05)
            SG90();
            translate([4,-10,6])
            cube([12,17,12]);                // Kabelplatz
            translate([6,-10,-13])
            cube([6,17,7]);                // Henkel
            translate([-23,-10,-13])
            cube([6,17,7]);                // Henkel
            translate([-18.0,-7,-13])
            cube([25,14,30]);              // Lang
            
            translate([-40,-10,-13])
            cube([15,20,30]);             // Prozessorplatz
            
            translate([15,-10,-13])
            cube([24,20,30]);              // Batterieplatz
        } 
        for (i=[1,-1])
        translate([i*14-5.5,0,-5])
        cylinder(d=2,h=10,$fn=40,center=true); // SG90 Befestigungslöcher
 
    }
}

module Torwart_imp () {
    union() {
        import("foosball_player_up-Body.stl",convexity=5);
        import("foosball_player_bottom-Body.stl",convexity=5);
    }
}

module Torwart() {
    rotate([180,-90,0])
    translate([-107,15,-9.5])
    scale(0.5)
    Torwart_imp();
}


module Horn() {

    import("SG90_one_horn_without_holes.stl",convexity=5);
}


module Hornadapter() {
    translate([0,1,-7.5])
    difference() {
        union() {
            translate([0,0,-1.5])
            cube([10,15,5],center=true);
            translate([0,11,-1])
            cylinder(d=10,h=7,center=true, $fn=60);
        }
        translate([0,11,-2])
        {
            translate([0,0,4])
            scale(1.15) 
            Horn();
            cylinder(d=7.5,h=7,center=true, $fn=60);
            translate([0,1,2])
            cube([6.5,8,4],center=true);
            cylinder(d=5.2,h=30,center=true, $fn=6);
        }
    }
}

module Achse() {
    translate([0,12,-59])
    union(){
        translate([0,0,0])
        cylinder(d=5,h=100,center=true, $fn=6);
        translate([0,0,33])
        cylinder(d=10,h=28,center=true, $fn=60);
    }
}

module Box() {
    difference(){
        Box_outer();
        Box_inner();
        Joystick_Hole();
        Box_Rillen();
        Schalter_Schlitz();
    }
    
    Front_Befestigung();
}

module Box_outer(){
    translate([0,0,0])
    cube([80,Hoehe,Tiefe],center=true);
}

module Box_inner(){
    translate([0,0,-Wand])
    cube([80-2*Wand,Hoehe-2*Wand,Tiefe],center=true);
}

module Box_Front(){
    translate([0,0,-(Tiefe/2-Wand)])
    difference() {
        union() {
            cube([Breite-5,Hoehe-5,2*Wand],center=true);
            Front_Nippel();
        }
        translate([0,Hoehe/2-8,0])
        cylinder(d=11.5,h=20,center=true);
    }
}

module Front_Befestigung() {
        translate([0,0,0])
        for (i=[1,-1])
            for (j=[1,-1])
                translate([i*(Breite/2-3),j*(Hoehe/2-3),0])
                cube([3,3,Tiefe-6],center=true);
}

module Box_Rillen() {
    rotate([0,90,0])
    translate([Tiefe/2-Wand,Hoehe/2-2,0])
    cylinder(d=2,h=70,$fn=40, center=true);

    rotate([0,90,0])
    translate([Tiefe/2-Wand,-(Hoehe/2-2),0])
    cylinder(d=2,h=70,$fn=40, center=true);

    rotate([90,90,0])
    translate([Tiefe/2-Wand,Breite/2-2,0])
    cylinder(d=2,h=30,$fn=40, center=true);

    rotate([90,90,0])
    translate([Tiefe/2-Wand,-(Breite/2-2),0])
    cylinder(d=2,h=30,$fn=40, center=true);
}

module Front_Nippel() {
    rotate([0,90,0])
    translate([0,(Hoehe/2-2.5),0])
    cylinder(d=2,h=65,$fn=40, center=true);

    rotate([0,90,0])
    translate([0,-(Hoehe/2-2.5),0])
    cylinder(d=2,h=65,$fn=40, center=true);

    rotate([90,90,0])
    translate([0,(Breite/2-2.5),0])
    cylinder(d=2,h=25,$fn=40, center=true);

    rotate([90,90,0])
    translate([0,-(Breite/2-2.5),0])
    cylinder(d=2,h=25,$fn=40, center=true);
}

module Schnitt() {
    translate([50,0,0])
    cube([100,300,300],center=true);
}

difference() {
    union() {
        if (Torwart) Torwart();
        if (Achse) Achse();
        if (Hornadapter) Hornadapter();
        if (Box) Box();
        if (Box_Front) Box_Front();
        if (SG90_Mount) SG90_Mount();
        if (SG90) SG90();
        if (Joystick) Joystick();
        if (Joystick_Mount) { 
            Joystick_Mount();
            translate([0,0,9])
            Joystick_Mount();
        }
        if (Joystick_Kappe) Joystick_Kappe();
     }
     
     if (Schnitt) Schnitt();
}