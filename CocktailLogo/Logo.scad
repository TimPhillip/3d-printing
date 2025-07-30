
shape = true;
liquid = true;
stiel = true;

zitroneSchale = true;
zitroneInhalt = true;

module glas() {
    polygon(points=[[0,10],[10,10],[10,30],[50,30],[100,10],[100,60],[50,40],[10,40],[10,60],[0,60]]);
};
module glasInhalt() {
    polygon(points=[[50,37],[50,33],[95,15],[95,55]]);
};

module stielInhalt() {
    polygon(points=[[50,37],[50,33],[7,33],[7,57],[2,57],[2,13],[2,57],[2,13],[7,13],[7,37]]);
};


module zitroneInhalt() {

    difference() {
        color("white") cylinder(r=15, h= 2);
    }
};
    
module zitroneSchale() {

    color("yellow") difference() {
        cylinder(r=20, h= 2);
        zitroneInhalt();
    }
}

module liquid() {
    color("red")linear_extrude(height = 2, center = true, convexity = 10, twist = 0) glasInhalt();
}

module stiel() {
    color("white")linear_extrude(height = 2, center = true, convexity = 10, twist = 0) stielInhalt();
}

module shape() {
    color("lightblue") difference() {
        linear_extrude(height = 2, center = true, convexity = 10, twist = 0) glas();
        linear_extrude(height = 2, center = true, convexity = 10, twist = 0) glasInhalt();
        linear_extrude(height = 2, center = true, convexity = 10, twist = 0) stielInhalt();
    }
}

module cocktail() {
    translate([0,0,1])
    union() {
        liquid();
        stiel();
        shape();
    }
}

if (shape) shape();
if (liquid) liquid();
if (stiel) stiel();

//if (zitroneSchale) translate([100,10,-1]) zitroneSchale(); 
//if (zitroneInhalt) translate([100,10,-1]) zitroneInhalt();
    


if (zitroneSchale) difference() {translate([100,10,-1]) zitroneSchale(); shape();}

if (zitroneInhalt) difference() {translate([100,10,-1]) zitroneInhalt(); shape();}
