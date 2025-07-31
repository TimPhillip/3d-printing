//Easter egg with decorations JTN 20240112

$fa=3;
$fs=0.1;		//make this smaller if you need better deco line definition (or larger if larger eggs)
eps=1/128;

len  = 120;		//egg length
a =	len*0.5;
b = 0.90*a;		//egg shape parameter
n = 120;		//number of divisions around the egg
lw = 0.6;		//line width for the decorations
dc = 0;		//number of decorations (or pairs if dp=0)
dp = 0;			//0 = both ways, 1 = ccw (looking from bottom), 2 = cw (looking from bottom)
ft = false;		//set to true (or 1) if you want the deco flatter at top & bottom (to false (or 0) if not)
grv = false;	//set to true for engraving, false for embossing

prns = [[-180:360/n :180],[0:360/n:180],[-180:360/n :0]];	//deco patterns

//	Egg curve courtesy of Mr. Itou
//	https://nyjp07.com/index_egg_E.html


module half_egg() {											//2D version of half of an egg (to be rotate extruded)		
//Ref. https://nyjp07.com/index_egg_E.html
	function p(t) = [ b*cos(t/4)*sin(t),-a*cos(t)  ];
	points=[ for (t= [0:180/n*2 :180]) p(t)];
	polygon(points);
}

module ribbon() {											//a pair of sinusoidal ribbons from pole to pole	
	points=[ for (t=prns[dp]) let (r=b*cos(t/4)*sin(t)) [r*sin(t),r*cos(t),-a*cos(t)]];
	for(i=[0:len(points)-2]) hull() {
		if (ft) {
			translate(points[i]) cylinder(h=eps,d=lw);		//flatter deco at top & bottom
			translate(points[i+1]) cylinder(h=eps,d=lw);
		} else {
			translate(points[i]) sphere(d=lw);				//round deco
			translate(points[i+1]) sphere(d=lw);
		}
	}
}

module Ei() {

    if (grv) difference() {
        rotate_extrude($fn=n) half_egg();							//the egg
        if (dc>0) for(i=[0:360/dc:359]) rotate([0,0,i])ribbon();	//the ribbons
        }
    else union() {
        rotate_extrude($fn=n) half_egg();							//the egg
        if (dc>0) for(i=[0:360/dc:359]) rotate([0,0,i])ribbon();	//the ribbons
    }
}

module hohlesEi() {
    difference(){
        Ei();
        scale(0.925)
        Ei();
    }
}

module Rand() {
    intersection() {
        hohlesEi();
        union(){
            rotate([20,90,0])
            cylinder(d=12,h=150,center=true);
            rotate([30,90,0])
            cylinder(d=9,h=150,center=true);
            rotate([40,90,0])
            cylinder(d=14,h=150,center=true);
            rotate([50,90,0])
            cylinder(d=10,h=150,center=true);
            rotate([65,90,0])
            cylinder(d=19,h=150,center=true);
            rotate([80,90,0])
            cylinder(d=12,h=150,center=true);
            rotate([90,90,0])
            cylinder(d=9,h=150,center=true);
            rotate([20,90,0])
            cylinder(d=12,h=150,center=true);
            rotate([100,90,0])
            cylinder(d=9,h=150,center=true);
            rotate([40,90,0])
            cylinder(d=14,h=150,center=true);
            rotate([110,90,0])
            cylinder(d=10,h=150,center=true);
            rotate([125,90,0])
            cylinder(d=19,h=150,center=true);
            rotate([140,90,0])
            cylinder(d=12,h=150,center=true);
            rotate([150,90,0])
            cylinder(d=9,h=150,center=true);
            rotate([160,90,0])
            cylinder(d=12,h=150,center=true);
        }
    }
}

module Eikorb() {
    difference(){
        Ei();
        translate([0,0,-65])
        cube([200,200,30],center=true);
        translate([0,40,50])
        cube([100,50,100],center=true);
        translate([0,-40,50])
        cube([100,50,100],center=true);
        
        scale(0.925)
        Ei();
    }
    translate([0,0,-47.5])
    cylinder(d=59,h=5,center=true);
    

}

Eikorb();
Rand();