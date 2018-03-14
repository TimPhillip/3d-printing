module lack(c = "black"){
    translate([0,0,400])
    color(c)
    cube([550,550,50]);
    color(c)
    cube([50,50,400]);
    translate([500,0,0])
    color(c)
    cube([50,50,400]);
    translate([500,500,0])
    color(c)
    cube([50,50,400]);
    translate([0,500,0])
    color(c)
    cube([50,50,400]);
}

module printer(){
    color("blue")
    cube([420,460,460]);
}

module extender(){
    translate([0,0,20])
    color("orange")
    cube([50,50,100]);
    color("orange")
    difference(){
        cube([53,53,140]); 
        cube([50,50,140]);
        //holes
        translate([25,50,10])
        rotate([-90,0,0])
        cylinder(r=4, h= 30);
        translate([25,50,130])
        rotate([-90,0,0])
        cylinder(r=4, h= 30);
        translate([50,25,130])
        rotate([-90,0,-90])
        cylinder(r=4, h= 30);
        translate([50,25,10])
        rotate([-90,0,-90])
        cylinder(r=4, h= 30);
    }
}


lack();
translate([0,0,450])
translate([0,0,100])
lack();
translate([65,45,450])
printer();

translate([500,500,430])
extender();
translate([500,50,430])
rotate([0,0,-90])
extender();
translate([50,500,430])
rotate([0,0,90])
extender();
translate([50,50,430])
rotate([0,0,-180])
extender();*/

extender();
