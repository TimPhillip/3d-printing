// Spannpratzen

B = 20;
T = 70;
H = 20;

b = 5;
t = 60;
h = 5;

pratze = true;
nabe = true;
pratze_beweglich = false;
pratze_gewinde = false;
knopf = false;
halter = false;
huelse = false;
stuetze = false;


if (pratze) pratze();
if (pratze_beweglich) pratze_beweglich();
if (pratze_gewinde) pratze_gewinde();
if (knopf) knopf();
if (stuetze) stuetze();
if (huelse) huelse();
if (halter) 
    translate([0,0,-H/2-h/2]) halter();

module pratze() {
    difference() {
        cube([B,T,H],center=true);
        translate([0,25,0])
        loch();
        translate([0,0,0])
        loch();
        translate([0,-25,0])
        loch();
    }
    translate([B/2+b/2,0,-H/2+h/2])
    if (nabe) nabe();
    
    translate([0,25,-H/2-1.25])
    nase();
    translate([0,-25,-H/2-1.25])
    nase();
}

module loch() {
    $fn = 60;
    cylinder(d=4.5,h=H+2,center=true);
    translate([0,0,H/2-1.4])
    cylinder(d=9.5,h=3.1,center=true);
    
}

module nase() {
    $fn = 60;
    difference() {
        cube([B,5.5,2.5],center=true);
        cylinder(d=4.5,h=4.5,center=true);
    }
}

module nase2() {
    $fn = 60;
    difference() {
        cube([B,5.5,2.5],center=true);
//        cylinder(d=4.5,h=4.5,center=true);
    }
}

module nabe() {
    cube([b,t,h],center=true);
}

module stuetze() {
    cube([B,T,h],center=true);
    translate([0,25,-h/2-1.25])
    nase2();
    translate([0,-25,-h/2-1.25])
    nase2();
}

module halter() {
    $fn = 60;
    difference() {
        cube([B-6,10,4],center = true);
        cylinder(d=4.5,h=4.5,center=true);
        
        translate([0,0,0.5])
        cylinder(d=8.3,h=3.8,center=true,$fn = 6);
   }
}

module pratze_beweglich() {
    difference() {
        pratze();
        translate([-B+5,0,0])
        schlitz_loch();
    }
}

module schlitz_loch() {
    
        rotate([0,90,0])
        cylinder(d=6.8,h=B,center=true);
    
        translate([B/2,0,-5])
        rotate([0,90,0])
        cube([20,15,3],center=true);
}


module pratze_gewinde() {
    difference() {
        cube([B,T,H],center=true);
        translate([0,25,0])
        loch();
        translate([0,-25,0])
        loch();

        translate([0,0,0])
        gewinde();
    }
   
    translate([0,25,-H/2-1.25])
    nase();
    translate([0,-25,-H/2-1.25])
    nase();


}

module gewinde() {
        $fn = 60;
        rotate([0,90,0])
        cylinder(d=4.92,h=B+5,center=true);
}

module knopf() {

    halbknopf();
    rotate([180,180,0])
    halbknopf();
}


module halbknopf() {
    $fn = 60;
    difference() {
    
        union() {
            cylinder(d=15,h=15, center=true, $fn=8);
            translate([0,0,5.5])
            cylinder(d=15,h=4, center=true);
        }    
        translate([20/2,0,0])
        cube([20,20,20],center=true);
        
        translate([0,0,0])
        cylinder(d=12,h=9, center=false);
        
    }
}


module huelse() {
    $fn = 60;
    difference() {
        cylinder(d=12,h=5, center=true);
        cylinder(d=4.92,h=5, center=true);
    }    

}