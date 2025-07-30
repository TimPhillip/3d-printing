// E10 Lampenfassung

use <../SchraubenUndMuttern/metric_iso_screw.scad>

/* Komponenten */
Schirm = true;
SchirmKlein = false;
Sockel = true;
Boden = true;
Birne = false;
Rundboden = false;
Laterne = false;



module Schirm()
{
    $fn=40;

    difference()
    {
        translate([0,0,15])
        difference()
        { 
            sphere(d=27);
            sphere(d=25.5);
        }
        cube([25,25,8],center=true);
    }
    translate([0,0,2])
    difference()
    {
        cylinder(d=18,h=5,center=true);
        translate([0,0,-5])
        screw_thread_iso_inner(
                d=16,
                lt=8,
                $fn=60
            );
    }
}

module SchirmKlein()
{
    $fn=40;

    difference()
    {
        translate([0,0,10])
        difference()
        { 
            sphere(d=20);
            sphere(d=17.5);
        }
        cube([25,25,8],center=true);
    }
    translate([0,0,2])
    difference()
    {
        translate([0,0,-1])
        cylinder(d=18,h=9,center=true);
        translate([0,0,-6])
        screw_thread_iso_inner(
                d=17,
                lt=12,
                $fn=60
            );
    }
}

module Sockel()
{

    // Lampenschirmgewinde M16
    translate([0,0,5])
    difference()
    {
        screw_thread_iso_outer(
		d=16,
		lt=5,
		cs=2,
		$fn=60);
        translate([0,0,2])
        cylinder(d=12,h=8,center=true);
    }

    // Mittelteil mit LED Gewinde M10
    difference()
    {
        cylinder(d=20,h=10, center=true);
        translate([0,0,-6])
        screw_thread_iso_inner(
                d=10,
                lt=12,
                $fn=60);
    }

    // Bodengewinde M20
    translate([0,0,-10])
    difference()
    {
        screw_thread_iso_outer(
		d=20,
		lt=5,
		cs=2,
		$fn=60);
        cylinder(d=15,h=34.5,center=true);
    }
}

module Boden()
{
    $fn = 40;
    translate([0,0,-10])
    hex_nut_iso(
		d=20,
		hg=6,
		$fn=60
	);
    
    rotate([0,0,-30])
    translate([0,0,-7.0])
    difference()
    {
        cube([30,40,6],center=true);
        cylinder(d=21,h=34.5,center=true);
        
        translate([10,15,0])
        cylinder(d=3,h=10,center=true);
        
        translate([-10,-15,0])
        cylinder(d=3,h=10,center=true);
    }
}

module Kabelkanal()
{
    $fn=40;
    rotate([0,90,-30])
    translate([7,0,-10])
    cylinder(d=4,h=30,center=true);
}

module Birne()
{
    sphere(d=10);
    translate([0,0,-8])
    cylinder(d=9,h=10,center=true);
}

module Laterne()
{
    scale([0.6,0.6,0.6])
    color("white")
    import("lamp.stl");
}

// ===================================

if (Sockel)
{
    difference()
    {
        Sockel();
        Kabelkanal();
    }
}

if (Schirm) translate([0,0,5]) Schirm();
if (SchirmKlein) translate([0,0,5]) SchirmKlein();

if (Boden) 
    difference()
    {
        Boden();
        Kabelkanal();
    }
    

if (Rundboden)
{
    Boden();
    difference()
    {
        union()
        {
        translate([0,0,22.5])
        sphere(d=81.5);
        }
        translate([0,0,31])
        cube([100,100,70],center=true);
        translate([0,0,-17])
        cylinder(d=25,h=30,center=true);
        translate([-10,0,0])
        Kabelkanal();
    }
}

if (Laterne)
    translate([0,0,17])
    Laterne();
if (Birne)
    translate([0,0,10])
    %Birne();