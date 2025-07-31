// Universalgetriebe

/* [Parameter]  */

Gehause_Hoehe = 44;
Gehause_Rundung = 40;
// Zahnradabstand 
ZA = 16.5;


/* [Komponenten] */
show_Universalgetriebe = true;
show_GehauseOben = false;
show_GehauseUnten = true;
show_Achshuelsen = false;

module DZ24()
{
    import("Doppelzahnrad-24-8.stl");
}

module Achse()
{
    cylinder(d=2,h=40,center=true, $fn=40);
}

module Rad(r,u)
{
    translate([0,0,0])
    Achse();
    translate([0,0,u])
    rotate([0,0,r])
    DZ24();
}

module Universalgetriebe()
{
    color("lightblue")
    Rad(0,-15);
    color("lightgray")
    translate([0,ZA,0])
    Rad(22.5,-10);
    color("lightyellow")
    rotate([0,0,0])
    translate([0,2*ZA,0])
    Rad(0,-5);
    color("lightgreen")
    translate([ZA,2*ZA,0])
    Rad(23,0);
    color("pink")
    translate([2*ZA,2*ZA,0])
    Rad(15,5);
}

module GehauseKontur(R,H)
{
    translate([0,0,0])
    hull()
    {
        cylinder(d=R,h=H,center=true,$fn=30);
        translate([0,R,0])
        cylinder(d=R,h=H,center=true,$fn=30);
        translate([R,R,0])
        cylinder(d=R,h=H,center=true,$fn=30);
    }
}

module GehauseInnen(R,H)
{
    translate([0,0,0])
    hull()
    {
        cylinder(d=R,h=H,center=true,$fn=30);
        translate([0,R+4,0])
        cylinder(d=R,h=H,center=true,$fn=30);
        translate([R+4,R+4,0])
        cylinder(d=R,h=H,center=true,$fn=30);
    }
}
module Gehause()
{
    difference()
    {
        GehauseKontur(Gehause_Rundung,Gehause_Hoehe);
        GehauseInnen(Gehause_Rundung-4,Gehause_Hoehe-4);
        Befestigungsloch();
        translate([0,0,3])
        Achshuelseloch(40);
        translate([0,ZA,3])
        Achshuelseloch(40);
        translate([0,2*ZA,3])
        Achshuelseloch(40);
        translate([ZA,2*ZA,3])
        Achshuelseloch(40);
        translate([2*ZA,2*ZA,3])
        Achshuelseloch(40);
    }
    
    difference()
    {
        Befestigung();
        Befestigungsloch();
    }
}

module GehauseUnten()
{
    difference()
    {
        Gehause();
        translate([0,0,Gehause_Hoehe/2+10])
        cube([200,200,Gehause_Hoehe],center=true);
    }
    difference()
    {
        Achshuelsen();
        if (show_GehauseUnten) 
        { 
            translate([0,0,Gehause_Hoehe/2+5])
            GehauseInnen(Gehause_Rundung,Gehause_Hoehe);
            translate([0,0,Gehause_Hoehe/2+5])
            cube([40,40,70],center=true);
        }
    }
}
module GehauseOben()
{
    difference()
    {
        translate([0,0,0])
        Gehause();
        translate([0,0,-Gehause_Hoehe/2+10])
        cube([200,200,Gehause_Hoehe],center=true);
    }
    difference()
    {
        Achshuelsen();
        if (show_GehauseOben) 
        { 
            translate([0,0,-Gehause_Hoehe/2-5])
            GehauseInnen(Gehause_Rundung,Gehause_Hoehe);
            translate([Gehause_Rundung,Gehause_Rundung,-Gehause_Hoehe+10])
            cube([60,60,70],center=true);
        }
    }
}

module Achshuelsen()
{
    difference()
    {
        union()
        {
            translate([0,0,0])
            Achshuelse(Gehause_Hoehe-4);
            translate([0,ZA,0])
            Achshuelse(Gehause_Hoehe-4);
            translate([0,2*ZA,0])
            Achshuelse(Gehause_Hoehe-4);
            translate([ZA,2*ZA,0])
            Achshuelse(Gehause_Hoehe-4);
            translate([2*ZA,2*ZA,0])
            Achshuelse(Gehause_Hoehe-4);
        }
        translate([0,0,-10])
        cube([10,10,11],center=true);
        translate([0,ZA,-5])
        cube([10,10,11],center=true);
        translate([0,2*ZA,0])
        cube([10,10,11],center=true);
        translate([ZA,2*ZA,5])
        cube([10,10,11],center=true);
        translate([2*ZA,2*ZA,10])
        cube([10,10,11],center=true);
    }
}

module Achshuelse(k)
{
    translate([0,0,0])
    difference()
    {
        cylinder(d=6,h=k,center=true, $fn=20);
        Achshuelseloch(k+2);
    }
}

module Achshuelseloch(k)
{
        cylinder(d=2.9,h=k,center=true, $fn=20);
}    

module Befestigung()
{
    translate([0,0,0])
    {
        rotate([0,0,45])
        translate([Gehause_Rundung/2,-Gehause_Rundung/3,0])
        cube([10,10,Gehause_Hoehe],center=true);
        translate([-Gehause_Rundung/4,Gehause_Rundung*5/4,0])
        rotate([0,0,45])
        cube([10,10,Gehause_Hoehe],center=true);
    }
}
module Befestigungsloch()
{
    $fn = 30;
    translate([0,0,0])
    {
        rotate([0,0,45])
        translate([Gehause_Rundung/2,-Gehause_Rundung/3,0])
        cylinder(d=3,h=Gehause_Hoehe,center=true);
        translate([-Gehause_Rundung/4,Gehause_Rundung*5/4,0])
        rotate([0,0,45])
        cylinder(d=3,h=Gehause_Hoehe,center=true);
    }
}

if (show_Universalgetriebe) %Universalgetriebe();
if (show_GehauseUnten) GehauseUnten();
if (show_GehauseOben) GehauseOben();
if (show_Achshuelsen) Achshuelsen();
