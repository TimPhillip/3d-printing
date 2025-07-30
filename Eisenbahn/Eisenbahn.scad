// Eisenbahn
//

rad=true;
schiene = false;
aufhangung = false;
rad_aufhang= false;
motor = false;
achse = false;
achsen_verschluss = false;
wagon_achse = false;
wagon = false;

antrieb=false;
zug = false;

/* [Eisenbahnrad] */
// [Radhöhe]
rh = 4;         
// [Steghöhe]
sh = 1;
// [Raddurchmesser]
rd = 28.5;
// [Stegdurchmesser]
sd = 35.75;

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

/* [Motor] */
// [Motorlänge]
        

if (antrieb) {
    antrieb();
}
else if(zug){
    translate([60,0,0])
    //rotate([0,0,-15])
    antrieb();
    translate([190,0,0])
    //rotate([0,0,15])
    antrieb();
    
    if(wagon) wagon();
} else {

    if (rad) rad();
    if (aufhangung) aufhangung();
    if (rad_aufhang) rad_aufhang();
    if (achse) achse();
    if (achsen_verschluss) achsen_verschluss();
    if (wagon_achse) wagon_achse();
    if (wagon) wagon();
}

module rad() {

    $fn = 60;
    
    // Radreifen
    difference() {
        union() {
            cylinder(h=rh, d=rd);
            cylinder(h=sh, d=sd);
        }
        translate([0,0,-0.5])
        cylinder(h=rh+1, d=rd-5);
    }
    
    // Speichen
    difference() {
        union() {
            cylinder(h=rh, d=12);
        
            for (i = [0:45:360]) {
                rotate([i,90,0])
                translate([-rh,-1,0])
                cube([rh,2,rd/2]);
            }
        
        }
        translate([0,0,-0.5])
        cylinder(h=rh+1, d=2.5);
               
        
        translate([0,0,-2])
        translate([0,0,-0.5])
        cylinder(h=rh+1, d=6.5);
               
    }
    translate([2.25,-4,0])
    cube([3,7,rh]);
    
    translate([-5.25,-4,0])
    cube([3,7,rh]);
    
}


module schiene() {

    translate([0,-sw/2-2,0])
    cube ([sl,4,5], center=true);
    translate([0,sw/2+2,0])
    cube ([sl,4,5], center=true);
    
    
    for (i = [-sl/2+ssa/2:ssa:sl/2]) {
        translate([i,0,-1.5])
        cube([5,sb,2], center=true);
    }
    
    

}


module aufhangung() {
    $fn = 60;

    rotate([90,0,0])
    union() {
        /*
        difference() {
            translate([ahl/2,0,0])
            #cube([ahl,8,3], center=true);
            
            translate([ahl-5,0,-2])
            cylinder(d=6.5, h=5);
            
            translate([9.5,-5.0,-0.5])
            cube([24.5,10,10,]);
        }*/    
        
        difference() {
            translate([0,0,-1])
            cube([5,25,5], center=true);
            
            translate([0,20,-1])
            rotate([90,0,0])
            cylinder(d=2, h= 40);
        }
        
        translate([0,9,-1.5])
        cylinder(d=3,h=8);
        
        
        translate([0,-9,-1.5])
        cylinder(d=3,h=8);

    }      
}


module motor() {
    $fn = 60;
    color("green")
    rotate([90,0,90])
    union() {    
            translate([-1,0,0])
            difference() {

            cylinder(d=20, h=28);
            translate([10,0,14])
            cube([3,25,30],center=true);
            translate([-10,0,14])
            cube([3,25,30],center=true);
            
        }
        
        translate([-1,-5,4])
        cube([11,10,24]);
        translate([-12,-5,4])
        cube([11,10,24]);
        
        difference() {
            translate([0,0,-37/2])
            cube([19,23,37],center=true);
            
            translate([-20,9,-5.5])
            rotate([0,90,0])
            cylinder(d=3, h=40);
            
            translate([-20,-9,-5.5])
            rotate([0,90,0])
            cylinder(d=3, h=40);
        }
        
        translate([-37/2,0,-25])
        rotate([0,90,0])
        cylinder(d=6, h=37);
    }
}


module achse() {
    $fn = 60;
    
    translate([0,37/2,0])
    rotate([90,0,0])
    union() {
        difference() {
            cylinder(d=6, h=37);
            
            translate([2,-4,-1])
            cube([3,7,rh]);
            translate([-5,-4,-1])
            cube([3,7,rh]);
            
            translate([2,-4,35-1])
            cube([3,7,rh]);
            translate([-5,-4,35-1])
            cube([3,7,rh]);
            
            
            translate([0,0,-5])
            cylinder(d=2, h = 50);
        }
        
    }
}

module wagon_achse(kurz_version= true){
    
    difference(){
        
        union(){
            
            hull(){
                translate([-4,-17,0])
                cube([8,34,5]);
                
                translate([-38,-3,0])
                cube([8,6,1]);
                
                translate([50,-3,0])
                cube([8,6,1]);
            }
            
            translate([10.5,0,0])
            cylinder(r=10, h= 7);
            translate([10.5,0,0])
            cylinder(r=6, h= 10.5);
            
        }
        
        //radkasten
        translate([-20,-21.5,0])
        cylinder(r=15, h= 20, center=true);
        translate([-20,21.5,0])
        cylinder(r=15, h= 20, center=true);
        translate([27,-25.5,0])
        cylinder(r=20, h= 20, center=true);
        translate([27,25.5,0])
        cylinder(r=20, h= 20, center=true);
        
        // m3 schrauben versenkt
        translate([0,-13,0])
        cylinder(d=3, h= 20, center= true, $fn = 12);
        translate([0,13,0])
        cylinder(d=3, h= 20, center= true, $fn = 12);
        translate([0,-13,2])
        cylinder(d=6, h= 20, center= false, $fn = 12);
        translate([0,13,2])
        cylinder(d=6, h= 20, center= false, $fn = 12);
        
        // schraube für den wagon
        translate([10.5,0,0])
        cylinder(d=3, h= 40, center=true, $fn= 12);
        
        // aussparung für kabel
        cube([20,16,5], center= true);
        translate([8,0,0])
        cube([58,8,5], center= true);
        translate([10.5,3.5,0])
        cube([4,3,40], center=true);
        translate([10.5,-3.5,0])
        cube([4,3,40], center=true);
        
        // befestigung vorne /hinten
        translate([-35,0,0])
        cylinder(d=3, h= 20, center= true, $fn = 12);
        translate([55,0,0])
        cylinder(d=3, h= 20, center= true, $fn = 12);
        
        if(kurz_version){
            translate([-50,-25,-3])
            cube([40,50,10]);
        }
        
        hull(){
            translate([40,7,0])
            cylinder(r=4, h= 4, center = true);
            translate([40,-7,0])
            cylinder(r=4, h= 4, center = true);
        }
        
        translate([40,0,0])
        cylinder(d=3, h= 20, center = true, $fn=12);
    }
    
    difference(){
        hull(){
            translate([40,7,0])
            cylinder(r=7, h= 4);
            translate([40,-7,0])
            cylinder(r=7, h= 4);
        }
        
        hull(){
            translate([40,7,0])
            cylinder(r=3, h= 4, center = true);
            translate([40,-7,0])
            cylinder(r=3, h= 4, center = true);
        }
        
        translate([40,0,0])
        cylinder(d=3, h= 20, center = true, $fn = 12);
    }
}

module rad_aufhang(){
    translate([-5.5,0,12.5])
    difference() {
        cylinder(r=3, h=1.75, $fn=100);
        cylinder(r=1.5, h=7.5, $fn=100, center = true);
    }
    
    translate([-10,-10,-4.5])
    difference() {
        cube([10,20,17]);
        translate([-0.5,5,-0.5])
        cube([11,10,15.5]);
        translate([5,27,4.5])
        rotate([90,0,0])
        cylinder(d=6.25, h=37, $fn=100);
        translate([3,-5,-0.5])
        cube([4,30,2.5]);
    }
}

module antrieb(){
    translate([-5.5,0,0])
    union(){
        if (rad) {
            translate([-25,-35/2+1,0])
            rotate([90,0,0]) rad();
            translate([-25,35/2-1,0])
            rotate([-90,0,0]) rad();
            
            translate([35,35/2-1,0])
            rotate([-90,0,0]) rad();
            translate([35,-35/2+1,0])
            rotate([90,0,0]) rad();
        }

        if (aufhangung) {
            
            translate([-5.5,11,0])
            aufhangung();
            
            translate([-5.5,-11,0])
            rotate([-180,0,0]) aufhangung();
            
        }
        
        if (rad_aufhang){
           translate([40,0,0])
           rad_aufhang();
        }

        if (achse) {
            translate([35,0,0])
            achse();
        }
        
        if (wagon_achse){
            translate([-5.5,0,12.5])
            wagon_achse();
        }

        if (schiene) translate ([0,0,-17.5]) schiene();
        if (motor) motor();
    }
}

module wagon(){
    color("lightgrey")
    translate([40,-12,20])
    difference(){
        cube([170,24,2]);
        //translate([2,2,2])
        //cube([250-4,70-4,60]);
        
        translate([20,12,0])
        cylinder(r= 7, h = 50, center=true);
        
        translate([150,12,0])
        cylinder(r= 7, h = 50, center=true);
    };
}

module achsen_verschluss(){
    
    difference(){
        cylinder(r=9, h= 1);
        
        translate([0,0,0])
        cylinder(d=3, h= 40, center=true, $fn= 12);
        
        translate([0,3.5,0])
        cube([4,3,40], center=true);
        translate([0,-3.5,0])
        cube([4,3,40], center=true);
    }

}