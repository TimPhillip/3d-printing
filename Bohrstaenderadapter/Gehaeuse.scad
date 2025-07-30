// Gehäuse-Gewindeschneider


front = true;
tastenplatine = true;
display = true;
beschriftungen = true;
startknopf = true;
abstandhalter_buttons = true;
dichtung_buttons = true;
abstandhalter_display = true;
dichtung_display = true;
box = true;
boxrand = true;

$fn = 60;

fx = 90;
fy = 145;
fz = 1;

bx = 90;
by = 145;
bz = 30;

dx = 70;
dy = 25;
dz = 10;

px = 30;
py = 70;
pz = 1.6;

fontup = fz;

raster = 2.54;

dkopf = 13.2;

    zeile0 = fy-10;
    zeile1 = zeile0-65-0*raster;
    zeile2 = zeile1-8*raster;
    zeile3 = zeile2-10*raster;
    zeile4 = zeile3-7*raster;
    
    spalte0 = 3;
    spalte1 = 60;
    spalte2 = spalte1+6.5*raster;

if (front) front();
if (tastenplatine) tastenplatine();    
if (display) display();    
// if (startknopf) startknopf();
if (abstandhalter_buttons) abstandhalter_buttons();
if (dichtung_buttons) dichtung_buttons();
if (abstandhalter_display) abstandhalter_display();
if (dichtung_display) dichtung_display();
if (box) box();
if (boxrand) boxrand();

module front() {
    
    
//translate([spalte1-dkopf/2+4.5,zeile2-31.5,-1])
//cube([5,37.5,3]);


    color("green")
    difference() {
        cube([fx,fy,fz]);
        
        // Displayloch
        translate([spalte0+6,zeile0-35,-1])
        cube([dx+2,dy+2,dz]);
        
        
        // Tasterlöcher
        translate([spalte1,zeile1,-1])
        cylinder(d=dkopf,h=fz+2);
        
        translate([spalte2,zeile1,-1])
        cylinder(d=dkopf,h=fz+2);
        
        translate([spalte1,zeile2,-1])
        cylinder(d=dkopf,h=fz+2);
        
        translate([spalte2,zeile2,-1])
        cylinder(d=dkopf,h=fz+2);
        
        translate([spalte1,zeile3,-1])
        cylinder(d=dkopf,h=fz+2);
        
        translate([spalte2,zeile3,-1])
        cylinder(d=dkopf,h=fz+2);

//        translate([spalte0+20,zeile4,-1])
//        cylinder(d=dkopf,h=fz+2);

        // Bohrlöcher
        translate([5,5,-1])
        cylinder(d=3,h=fz+2);
        translate([fx-5,5,-1])
        cylinder(d=3,h=fz+2);
        translate([5,fy-5,-1])
        cylinder(d=3,h=fz+2);
        translate([fx-5,fy-5,-1])
        cylinder(d=3,h=fz+2);


    }
    
    // Beschriftungen
    if (beschriftungen) {
        translate([20,zeile0,fontup])
        beschriftung("Gewindebohrer");

        translate([47,8,fontup])
        beschriftung("GWB 3000");

        translate([spalte1-6,zeile1+6,fontup])
        beschriftung("-");
        
        translate([spalte2+4,zeile1+6,fontup])
        beschriftung("+");
        
        translate([spalte0,zeile1,fontup])
        beschriftung("Umdrehungen");
        
        translate([spalte1-6,zeile2+6,fontup])
        beschriftung("-");
        
        translate([spalte2+4,zeile2+6,fontup])
        beschriftung("+");
        
        translate([spalte0,zeile2,fontup])
        beschriftung("Speed");
        
        translate([spalte0,zeile3,fontup])
        beschriftung("links/rechts");
        
//        translate([spalte1-25,zeile4,fontup])
//        beschriftung("Start/Stop");
    }
}

module beschriftung(tt){
    color("white")
    linear_extrude(height = 1.2, center=true, convexity = 10, twist = 0) 
    {
        text(tt, size = 5, font = "Liberation Sans:style=Bold Italic");
    }
}

module tastenplatine() {

    color("lightgreen")
    translate([spalte1-dkopf/2+px/2,zeile3+py/2-dkopf+1,-8-pz/2])
    // Grundplatine mit Montagelöchern
    difference() {
        cube([px,py,pz],center=true);
        
        translate([-px/2+2,py/2-2,-1])
        cylinder(d=2,h=3);
        
        translate([px/2-2,py/2-2,-1])
        cylinder(d=2,h=3);
        
        translate([-px/2+2,-py/2+2,-1])
        cylinder(d=2,h=3);
        
        translate([px/2-2,-py/2+2,-1])
        cylinder(d=2,h=3);
    }
    
    color("white")
    translate([spalte1,zeile1,-8])
    cylinder(d=dkopf-2,h=13);
    
    color("white")
    translate([spalte2,zeile1,-8])
    cylinder(d=dkopf-2,h=13);
    
    color("blue")
    translate([spalte1,zeile2,-8])
    cylinder(d=dkopf-2,h=13);
    
    color("blue")
    translate([spalte2,zeile2,-8])
    cylinder(d=dkopf-2,h=13);
    
    color("red")
    translate([spalte1,zeile3,-8])
    cylinder(d=dkopf-2,h=13);
    
    color("red")
    translate([spalte2,zeile3,-8])
    cylinder(d=dkopf-2,h=13);
}

module display() {
    color("black")
    translate([spalte0+7,zeile0-34,-8])
    cube([dx,dy,dz]);
    translate([spalte0+2.5,zeile0-39,-18])
    cube([dx+10,dy+10,dz]);
}

module startknopf() {
    color("black")
    translate([spalte0+20,zeile4,-8-pz/2])
    cylinder(d=dkopf-2,h=13);
}

module abstandhalter_buttons() {
    color("lightblue")
    translate([spalte1-13,zeile3-13,-7-pz/2])
    difference() {
        translate([0,0,0])
        cube([px+9,py+2,8]);
        translate([3.5,5,-1])
        cube([px+4,py-8,10]);
    }
}

module dichtung_buttons() {
    color("lightgray")
    translate([spalte1-13,zeile3-13,-7-pz/2])
    difference() {
        translate([0,0,0])
        cube([px+9,py+2,0.8]);
        translate([3.5,5,-1])
        cube([px+4,py-8,10]);
    }
}

module abstandhalter_display() {
    color("lightblue")
    translate([spalte0+2.5,zeile0-41,-6-pz/2])
    difference() {
        translate([0,0,0])
        cube([80,39,5]);
        translate([3.5,6,-1])
        cube([80-8,37-9,10]);
        translate([74.5,7,-7])
        cube([6,24,10]);
        translate([4,34.5,-1])
        cube([43,3,10]);
    }
}

module dichtung_display() {
    color("lightblue")
    translate([spalte0+2.5,zeile0-41,-6-pz/2])
    difference() {
        translate([0,0,0])
        cube([80,39,1.6]);
        translate([3.5,6,-1])
        cube([80-8,37-9,10]);
//        translate([74.5,7,-7])
//        cube([6,24,10]);
        translate([4,34.5,-1])
        cube([43,3,10]);
    }
}

module box() {
    color("darkgreen")
    translate([-2.5,-2.5,-bz+fz])
    difference() {
        cube([bx+5,by+5,bz]);
        translate([1.5,1.5,2])
        cube([bx+2,by+2,bz]);
    }
}

module boxrand() {
    color("gray")
    translate([-1,-1,-5])
    difference() {
        cube([bx+2,by+2,5]);
        translate([4.5,4.5,-5])
        cube([bx-7,by-7,bz]);
    }

    // Gewindelöcher
    color("gray")
    translate([-1,-1,-5])
    difference() {
        cube([10,10,5]);
        translate([6,6,-1])
        cylinder(d=2.5,h=7);
    }

    color("gray")
    translate([-1,-1+fy-10,-5])
    difference() {
        cube([10,10,5]);
        translate([6,6,-1])
        cylinder(d=2.5,h=7);
    }

    color("gray")
    translate([-1+fx-10,-1,-5])
    difference() {
        cube([10,10,5]);
        translate([6,6,-1])
        cylinder(d=2.5,h=7);
    }

    color("gray")
    translate([-1+fx-10,-1+fy-10,-5])
    difference() {
        cube([10,10,5]);
        translate([6,6,-1])
        cylinder(d=2.5,h=7);
    }
}