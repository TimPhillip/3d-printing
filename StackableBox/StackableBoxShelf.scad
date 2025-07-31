// Stackable Box Shelf

hB = 35;    // Höhe der Box
bB = 48;    // Breite der Box
bT = 60;    // Tiefe der Box

/* [Dimensionen] */
nX = 3;
nY = 4;

show_Boxes = true;
show_Shelf = true;
show_xTrager = false;
show_yTrager = false;
show_zTrager = false;
show_zTragerHalf = false;

show_Top = false;
show_Bottom = false;


if (show_Boxes) Boxes();
if (show_Shelf) Shelf();
if (show_xTrager) 
    for (i=[0:1:nX])
    for (k=[0:1:nY])
        xTrager(i,k);
    
if (show_yTrager) 
    for (i=[0:1:nX-1])
    for (k=[0:1:nY])
        yTrager(i,k);

if (show_zTrager) 
    for (i=[0:1:nX])
    for (k=[0:1:nY])
        zTrager(i,k);

if (show_Top) Top();
if (show_Bottom) Bottom();


module Boxes() {

    for (i=[0:1:nX-1])
    for (k=[0:1:nY-1])
        color("lightblue")
        translate([0,i*bB+50.5,k*hB+10])
    scale([0.5,0.5,0.5])import("D:/Programme/OpenSCAD/Things/StackableBox/stack_box.stl");
}


module Shelf() {

    for (i=[0:1:nX])
    for (k=[0:1:nY])
    {
        xTrager(i,k);
    }
    for (i=[0:1:nX-1])
    for (k=[0:1:nY])
    {
        yTrager(i,k);
    }
    for (i=[0:1:nX])
    for (k=[0:1:nY-1])
    {
        zTrager(i,k);
    }
}

module xTrager(i,k) {
    color("lightblue")
    difference()
    {
        union() {
            translate([-bT,i*bB-6,k*hB-2])
            cube([bT,5,10]);
            translate([-60,i*bB-11,k*hB-2])
            cube([bT,15,2]);
        }
        translate([-15,i*bB-3.5,k*hB])
        cylinder(d=3,h=5+hB,center=true,$fn=20);
        translate([-5,i*bB-3.5,k*hB])
        cylinder(d=3,h=5+hB,center=true,$fn=20);
        translate([-bT+5,i*bB-3.5,k*hB])
        cylinder(d=3,h=5+hB,center=true, $fn =30);
        translate([-bT+15,i*bB-3.5,k*hB])
        cylinder(d=3,h=5+hB,center=true, $fn =30);
        translate([-5,i*bB+1.5,k*hB])
        cylinder(d=1.5,h=20,center=true,$fn=20);
        translate([-bT+5,i*bB+1.5,k*hB])
        cylinder(d=1.5,h=5+hB,center=true, $fn =30);
        translate([-5,i*bB-8.5,k*hB])
        cylinder(d=1.5,h=20,center=true,$fn=20);
        translate([-bT+5,i*bB-8.5,k*hB])
        cylinder(d=1.5,h=5+hB,center=true, $fn =30);
    }
}

module yTrager(i,k) {
        color("lightgreen")
        difference() {
            translate([-10,i*bB-1,k*hB-5])
            cube([10,bB-5,5]);
            translate([-11,i*bB-2,k*hB-2])
            cube([12,6,3]);
            translate([-11,i*bB+bB-11,k*hB-2])
            cube([12,6,3]);
            translate([-5,i*bB+1.5,k*hB-2])
//            cylinder(d=3,h=15,center=true,$fn =30);
            Senkloch(4,2,1.5,14,"unten");
            translate([-5,i*bB+bB-8.5,k*hB-2])
//            cylinder(d=3,h=15,center=true,$fn =30);
            Senkloch(4,2,1.5,14,"unten");
        }
        
        color("lightgreen")
        difference() {
            translate([-bT,i*bB-1,k*hB-5])
            cube([10,bB-5,5]);
            translate([-bT-1,i*bB-2,k*hB-2])
            cube([12,6,3]);
            translate([-bT-1,i*bB+bB-11,k*hB-2])
            cube([12,6,3]);
            translate([-bT+5,i*bB+1.5,k*hB-2])
//            cylinder(d=3,h=15,center=true,$fn =30);
            Senkloch(4,2,1.5,14,"unten");
            translate([-bT+5,i*bB+bB-8.5,k*hB-2])
//            cylinder(d=3,h=15,center=true,$fn =30);
            Senkloch(4,2,1.5,14,"unten");
        }
}

module zTrager(i,k) {
    zTragerHalf1(i,k);
    if(!show_zTragerHalf)zTragerHalf2(i,k);
    
}
module zTragerHalf2(i,k) {
        color("lightgray")
        difference() {
                translate([-bT,i*bB-6,k*hB-2+10])
                cube([10,5,hB-10]);
            translate([-bT+5,i*bB-3.5,k*hB-2+20])
            cylinder(d=1.5,h=5+hB,center=true, $fn =30);
    }
}

module zTragerHalf1(i,k) {
        color("lightgray")
        difference() {
            translate([-10,i*bB-6,k*hB-2+10])
            cube([10,5,hB-10]);
            translate([-5,i*bB-3.5,k*hB-2+20])
            cylinder(d=1.5,h=5+hB,center=true, $fn =30);
            }
}

module Platte() {
    difference(){
        union() {
            translate([-bT,-11,-4])
            cube([bT,bB+7.5,2]);
        }
        translate([-bT+10,-11+10,-5])
        cube([bT-20,bB-5,4]);
    }
}

module Top() {
    translate([0,0,nY*hB])
    Platte();
}

module Bottom() {
    Platte();
}

module Senkloch(d1,d2,h1,h2,r) {
    if (r=="oben")
    {
        translate([0,0,0])
        cylinder(d=d2,h=h2, center=true,$fn=30);
        translate([0,0,h2/2])
        cylinder(d=d1,h=h1, center=true,$fn=30);
    }
    if (r=="unten")
    {
        translate([0,0,2])
        cylinder(d=d2,h=h2-3, center=true,$fn=30);
        translate([0,0,-h2/2+4.5])
        cylinder(d=d1,h=h1, center=true,$fn=30);
    }
}