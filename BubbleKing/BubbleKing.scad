// Bubble King
use <../MiniMotor\MiniMotor.scad>
use <../BubbleMachine\Pustefix.scad>
use <../H-BrueckenHalter\H-Brueckenhalterung.scad>

/* [Box Dimension] */
// Box Länge 
BX = 195;
// Box Breite 
BY = 100;
// Box Höhe 
BZ = 100;
BWand = 5;
// Box Wandstärke nach Aushöhlen
BAbstand = 18;
// Abstand 

/* [Aufteilung der Box Dimensionen] */
BT1X = 130;
BT2X = BX-BT1X;

/* [Verschraubungsmaße ] */
ab = 2.5;       // Abstand des Schraublochs vom Rand
kl = 2.5;       // Kopfloch
sl = 2.5;       // Schraubloch

/* [Box Komponenten] */
show_Top = false;
show_Floor = true;
show_Back = false;
show_Front = false;
show_Seite_Links = false;
show_Seite_Rechts = false;
show_Griff = false;
show_FanHalter = false;
show_Beschriftung = false;

/* [Einzelteile zeigen] */
show_FloorPart1 = true;
show_FloorPart2 = true;
show_Zwischenwand = true;
show_FrontPart1 = true;
show_FrontPart2 = true;
show_Seite_Links1 = true;
show_Seite_Links2 = true;
show_Seite_Rechts1 = true;
show_Seite_Rechts2 = true;
show_FanHalt1 = true;
show_FanHalt2 = true;

/* [Einzelteile drucken] */
print_FloorPart1 = false;
print_FloorPart2 = false;
print_Zwischenwand = false;
print_FrontPart1 = false;
print_FrontPart2 = false;

/* [Innereien] */
show_Fan = false;
show_Rad = false;
show_Achsverlaengerung = false;
show_stepmotor = false;
show_Trog = false;
show_Trichter = false;
show_Trichteradapter = false;

// ----------------------------------
LL = BT1X;

af = LL/2/sin(45);           // Länge des Schenkels
echo("af = ",af);

fh = 0.5*sqrt(4*pow(af,2)-pow(LL,2));   // Höhe des Winkels
echo("fh = ",fh);

// ----------------------------------

if (show_Floor) translate([BT1X/2,0,-BWand/2]) Floor();
if (show_Back)  translate([BWand/2,0,BZ/2])Back();
if (show_Front) translate([BX-BWand/2,0,0]) Front();
if (show_Top)   translate([0,0,BZ+BWand/2]) Top();
if (show_Griff) translate([0,0,BZ+BWand/2]) Griff();
if (show_FanHalter) FanHalter();
if (show_Beschriftung) Beschriftung();
if (show_Trog) translate([BT1X+30,0,0]) rotate([0,0,90]) Trog();
if (show_Achsverlaengerung) translate([BT1X+25,0,BZ/2])Achsverlaengerung();
if (show_Trichter) rotate([180,-90,0])translate([BZ/2+7,0,103])Trichter();
if (show_Trichteradapter) rotate([180,-90,0])translate([BZ/2+7,0,103])Trichteradapter();
    
if (print_FloorPart1) translate([0,0,0]) FloorPart1();
if (print_FloorPart2) translate([0,0,0]) FloorPart2();
if (print_Zwischenwand) translate([0,0,0]) Zwischenwand();
if (print_FrontPart1) translate([0,0,0]) FrontPart1();
if (print_FrontPart2) translate([0,0,0]) FrontPart2(af);


if (show_Fan) {
    rotate([0,0,90])
    translate([-34/2,-98/2-BWand,98/2])Fan(98);
//    rotate([0,-45,0])
//    translate([60,0,-5])Fan(60);
}
if (show_Rad) translate([BX-38.5,0,50]) color("red") rad($t);

if (show_stepmotor) {
    color("lightblue")
    translate([BT1X-10,0,41.5])
    rotate([-90,0,-90])
    scale([10,10,10])
    import("../28BYJ-48-Stepper/StepMotorModel.stl");
}

if (show_Seite_Links) Seite_Links(); 
if (show_Seite_Rechts) Seite_Rechts(); 

// ----------------------------------
module Floor()
{
    if (show_FloorPart1)
    translate([0,0,0])
    FloorPart1();
    
    if (show_Zwischenwand)
    translate([BT2X-BWand/2,0,BWand/2])
    Zwischenwand();
    
    if (show_FloorPart2)
    translate([BT1X/2+BT2X/2,0,0])
    FloorPart2();

}

module FloorPart1()
{
    FloorPart(BT1X,BY);
    
}

module FloorPart2()
{
    FloorPart(BT2X,BY);
}

module FloorPartAusholung(PX,PY)
{
        translate([0,0,BWand/2])
        cube([PX-BAbstand,PY-BAbstand,BWand],center=true);
}

module FloorPart(PX,PY)
{
    $fn = 30;
    difference()
    {
        cube([PX,PY,BWand],center=true);
        Holes(PX,PY,BWand);
        FloorPartAusholung(PX,PY);
        
        // Schraublöcher
        rotate([0,90,0])
        translate([0,-PY/2+ab,-PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,PY/2-ab,-PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,-PY/2+ab,PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,PY/2-ab,PX/2])
        cylinder(d=sl,h= 60, center=true);
        
        // Schraublöcher 2. Reihe
        rotate([0,90,0])
        translate([0,-PY/2+3*ab,-PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,PY/2-3*ab,-PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,-PY/2+3*ab,PX/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,90,0])
        translate([0,PY/2-3*ab,PX/2])
        cylinder(d=sl,h= 60, center=true);
      }
}  

module Holes(xh,yh,zz)
{
    $fn = 30;
    
    translate([-(xh/2-ab),-(yh/2-ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([+(xh/2-ab),-(yh/2-ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([-(xh/2-ab),+(yh/2-ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([+(xh/2-ab),+(yh/2-ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    
    // Holes 2. Reihe

    translate([-(xh/2-ab),-(yh/2-3*ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([+(xh/2-ab),-(yh/2-3*ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([-(xh/2-ab),+(yh/2-3*ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
    translate([+(xh/2-ab),+(yh/2-3*ab),0])
    {
        cylinder(d=sl,h=zz*2, center=true);
        translate([0,0,-zz/2])
        cylinder(d=kl,h=zz/2, center=true);
    }
}

module Back()
{
    difference()
    {
        $fn = 30;
        cube([BWand,BY,BZ], center=true);
        // Hohlraum
        translate([BWand/2,0,-BWand/2])
        cube([BWand,BY-BAbstand,BZ],center=true);
        
        // Schraublöcher
        translate([0,-BY/2+ab,-BZ/2])
        cylinder(d=sl,h= 60, center=true);
        translate([0,BY/2-ab,-BZ/2])
        cylinder(d=sl,h= 60, center=true);
        translate([0,-BY/2+ab,BZ/2])
        cylinder(d=sl,h= 60, center=true);
        translate([0,BY/2-ab,BZ/2])
        cylinder(d=sl,h= 60, center=true);
        
        // Ventilator Ansaugöffnung
        translate([0,0,0])
        Grid();
        
        // Stromanschluss
        rotate([0,90,0])
        translate([40,-BY/2+19,0])
        cylinder(d=13, h=30, center=true);
        
        // Ein- Ausschalter
        rotate([0,90,0])
        translate([38,BY/2-18,0])
        cube([19.5,13,10], center=true);
        
    }
    // Mittelkreis
    translate([-1.25,0,0])
    rotate([0,-90,0])
    cylinder(d=30,h= 2.5, center=true);
    
}

module Grid()
{
    for (i = [0:1:8])
    {
        translate([-1,0,0])
        rotate([20*i,0,0])
        cube([10,70,4],center=true);
    }

}

module Winkel(XP)
{
    a = XP/2/sin(45);           // Länge des Schenkels
    echo("a = ",a);
        
    difference()
    {
        union()
        {
            translate([0,0,0])
            cube([a+5,BY,BWand], center=true);
            translate([-a/2,0,a/2])
            cube([BWand,BY,a+5], center=true);
        }
        translate([-CWand-1,0,-CWand])
        cube([a,BY-10,BWand], center=true);

        translate([-a/2-CWand,0,a/2])
        translate([0,0,-CWand])
        cube([BWand,BY-10,a], center=true);
    }
}

module Zwischenwand()
{
    translate([0,0,BZ/2])
    rotate([0,90,0])
    difference()
    {
        FloorPart(BZ,BY);
        
        // Windöffnung
        translate([-27,0,0])
        cube([30,35,20], center=true);
        
        // Radantriebsloch
        rotate([0,0,-90])
        scale([10.5,10.5,10.5])
        translate([0,0.8,0])
        import("../28BYJ-48-Stepper/StepMotorModel.stl");

        // Schraublöcher
        $fn = 30;
        rotate([0,-90,0])
        translate([0,-BY/2+ab,-BZ/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,-90,0])
        translate([0,BY/2-ab,-BZ/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,-90,0])
        translate([0,-BY/2+ab,BZ/2])
        cylinder(d=sl,h= 60, center=true);
        rotate([0,-90,0])
        translate([0,BY/2-ab,BZ/2])
        cylinder(d=sl,h= 60, center=true);
        

    }
}

module Fan(Diameter){
    $fn = 30;
    F1Q = Diameter;
    F1D = 34;
    color("lightgray")
    rotate([90,175,-90])
    translate([0,3,-34/2])
    import("../Lufter/LufterWL9834.stl");

}

module Rad()
{
    rotate([0,90,0])
    translate([0,0,0])
    cylinder(d=100,h=3,center=true);
}

module rad(t){
    rotate([360*-t,0,0])
    translate([-3,0,0])
    difference(){
    
        for (i= [0,1,2,3,4,5,6,7]) {
            rotate([i*25.71,0,0])
            cube([2,5,63], center = true, $fn = 30);
            translate([0,0,0])
            rotate([i*25.71,0,0])
            fix();
            translate([0,0,0])
            rotate([i*-25.71,0,0])
            fix();
        }
    achse();
    }
}
 
module fix() 
{
     rotate([0,90,0])
     translate([38.5,0,0]){
     scale([0.2,0.2,0.2])pustefix();
     }
}
 
module achse()
{
     rotate([0,90,0])
     translate([0,0,0]){
        difference() {
            cylinder(d=5.75, h=7,center=true, $fn=30);
            
            translate([10+1.75,0,0])
            cube([20,20,20],center=true, $fn=30);
            translate([-10-1.75,0,0])
            cube([20,20,20],center=true, $fn=30);
        }
    }
 }


module Front()
{
    if (show_FrontPart1)
    translate([0,0,20])
    rotate([0,90,180])
    FrontPart1();
    

    if (show_FrontPart2)
    translate([-31.5,0,fh+BWand])
    rotate([180,45,0])
    FrontPart2(af);

}


module FrontPart1()
{
    
    FloorPart(40,BY);
    
}

module FrontPart2(af)
{

    difference()
    {
        FloorPart(af,BY);
        translate([-15,0,0])
        cube([45,BY-20,100],center=true);
        
        translate([BY/2,0,0])
        rotate([0,-45,0])
        cube([10,BY+20,100],center=true);
        
        translate([-BY/2-1,0,0])
        rotate([0,45,0])
        cube([10,BY+20,100],center=true);
        
    }
    
}

module Top()
{
    $fn = 30;
    LL = BT1X;
    difference()
    {
        translate([LL/2,0,0])
        rotate([180,0,0])
        FloorPart(LL,BY);
        Grifflocher();
    }
}

module Griff()
{
    GD = 10;
    $fn = 30;
    rotate([0,90,0])
    translate([-30,0,BT1X/2])
    cylinder(d=GD,h=BT1X-30,center=true);
    difference()
    {
        union()
        {
            translate([BT1X/4,0,15])
            cylinder(d=GD,h=30,center=true);
            translate([BT1X*3/4,0,15])
            cylinder(d=GD,h=30,center=true);
        }
        Grifflocher();
    }
}

module Grifflocher()
{
    translate([BT1X/4,0,15])
    cylinder(d=sl,h=32,center=true);
    translate([BT1X*3/4,0,15])
    cylinder(d=sl,h=32,center=true);
}

module Seite_Links()
{
    if (show_Seite_Links1)
    rotate([90,0,0])
    translate([BT1X/2,BZ/2,-BY/2+BWand/2])
    FloorPart(BT1X-BWand*2,BY);
    
    if (show_Seite_Links2)
    {
        difference()
        {
            union()
            {
                translate([BT1X+BT2X/2-BWand/2,BY/2-BWand/2,BT2X/2-2.5*BWand])
                rotate([90,90,0])
                FloorPart(40-1,BT2X-BWand-1);
                
                 translate([BT1X+20.5-2*BWand,BY/2-BWand/2-0.9,BZ-40-2.0])
                rotate([90,0,180])
                anglePart(BZ-40-4.5,60-4,BWand);
            }
            translate([BT1X+27.5,BY/2-BWand,BZ-64])
            cube([36,5,20],center=true);
        }
    }
}

module Seite_Rechts()
{
    if (show_Seite_Rechts1)
    rotate([-90,0,0])
    translate([BT1X/2,-BZ/2,-BY/2+BWand/2])
    FloorPart(BT1X-BWand*2,BY);

    if (show_Seite_Rechts2)
    {
        difference()
        {
            union()
            {
            translate([BT1X+BT2X/2-BWand/2,-BY/2+BWand/2,BT2X/2-2.5*BWand])
            rotate([-90,-90,0])
            FloorPart(40-1,BT2X-BWand-1);
            
            translate([BT1X+19.5,-BY/2+BWand/2+1,BZ-40-2*BWand-1.5])
            rotate([90,90,0])
            anglePart(BZ-40-4,60-4,BWand);
            }
            translate([BT1X+27.5,-BY/2+BWand,BZ-65])
        cube([36,5,20],center=true);
        }
    }
}

module FanHalter()
{
   if (show_FanHalt1) FanHalt();
   if (show_FanHalt2) rotate([180,0,0])    
      translate([73+BWand,0,-BY])
      FanHalt();
}

module FanHalt()
{
    translate([10+BWand,0,BY-2.5])
    cube([20,BY-2*BWand-1,5], center=true);
    $fn = 30;
    
    difference()
    {
        union()
        {
            translate([10+BWand,18.5,BY-15])
            cube([20,2,20], center=true);

            translate([10+BWand,-18.5,BY-15])
            cube([20,2,20], center=true);
        }
        translate([8.5+BWand,0,BY-20])
        rotate([90,0,0])
        cylinder(d=5, h=BY, center=true);
        
        translate([12+BWand,0,BY-12])
        rotate([90,0,0])
        cylinder(d=5, h=BY, center=true);
    }
    
}

module Beschriftung()
{
    translate([BX/10,-BY/2,BZ/2])
    rotate([90,0,0])
    beschriftung("Bubble King");
    translate([60,-BY/2,BZ/2])
    color("white")
    {
        cube([80,1.2,1],center=true);
        translate([20,0,30])
        Bubbles();
    }
}

module beschriftung(tt){
    color("white")
    linear_extrude(height = 2.2, center=true, convexity = 10, twist = 0) 
    {
        text(tt, size = 10, font = "Liberation Sans:style=Bold Italic");
    }
}

module Bubbles()
{
    rotate([90,0,0])
    {
        difference()
        {
            cylinder(d=30,h=2.2,center=true);
            cylinder(d=20,h=3.2,center=true);
        }
        translate([4,2,0])
        difference()
        {
            cylinder(d=15,h=2.2,center=true);
            cylinder(d=10,h=3.2,center=true);
        }
       
    }    
}

module dreieck_rechtwinklig(c,a,z)
{
    translate([-c/3,-a/3,-z/3])
	linear_extrude(height=z)
	polygon(points = [ [-c/2, 0], [c/2, 0], [c/2, a]]);
}

module anglePart(cc,aa,zz)
{
    difference()
    {
        dreieck_rechtwinklig(cc,aa,zz);
        translate([0,0,-BWand/2])
        dreieck_rechtwinklig(cc-BAbstand,aa-BAbstand,zz);
    }
}

module Trog() {
    difference(){
        translate([0,0,0])
        minkowski(){
            hull()
            {
            cube([BY-BAbstand-5,35,1],center=true);
            translate([0,0,22])
            cube([BY-BAbstand/2-5,35,1],center=true);
            }
            sphere(r = 2);
        }
        translate([0,0,BY/2-2])
        rotate([90,0,0])
        translate([0,0,0])
        cylinder(d=BY,h=34,center=true,$fn=60);
    }
}

module Achsverlaengerung() {
      color("lightblue")
      rotate([0,90,0])
      translate([0,0,-16])
      difference() {
            cylinder(d=10, h=18,center=true, $fn=30);

            rotate([90,90,0])
            translate([6,0,0])
            achse();
            rotate([0,90,90])
            translate([5,0,4])
            cylinder(d=3,h=26, center=true, $fn=30);

            translate([0,0,0])
            cylinder(d=2,h=26, center=true, $fn=30);
          
                        translate([6.5,0,8.5])
    cube([10,10,4],center=true);
                        translate([-6.5,0,8.5])
    cube([10,10,4],center=true);
                        translate([0,7.5,8.5])
    cube([10,10,4],center=true);
                        translate([0,-7.5,8.5])
    cube([10,10,4],center=true);
      }
}

module Trichter()
{

    difference()
    {
        translate([10,0,0])    
        cube([63,37,4],center=true);
        translate([10,0,0])    
        cube([61,35,5], center=true);
 
    }
    translate([-9,0,2])    
    cube([25,37,1], center=true);



    translate([20,0,4])    
    difference()
    {
        hull()
        {
            translate([2,0,0])
            cube([39,37,4],center=true);
            translate([0,0,10])
            cube([31,35,4], center=true);
        }
     
        
       
        hull()
        {
            cube([31,35,5],center=true);
            translate([0,0,10])    
            cube([28,33,5], center=true);
        }
    }


    difference()
    {
        translate([20,0,17])    
        cube([28.5,33.5,2],center=true);
        translate([20,0,17])    
        cube([26.5,31.5,3], center=true);
 
    }

}

module Trichteradapter()
{
    translate([20,0,16])
    difference()
    {
        hull()
        {
            cube([31,35,1],center=true);
            translate([0,0,14])    
            cube([26.5,31.5,1], center=true);
        }
        
        
        hull()
        {
            cube([29,34,2],center=true);
            translate([0,0,14])    
            cube([24.5,29.5,2], center=true);
        }
    
    }
    
}