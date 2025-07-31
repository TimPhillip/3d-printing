Vagabund = false;
Horst=true;
Lizard=false;
BlueAgent = false;
Spion = false;
Haus = false;
Gorilla = false;
Gepard = false;
Antilope = false;
Sockel = false;
Shark = false;
Elephant = false;
Hippo = false;
Leopard = false;
Lion = false;
Seekuh = false;
Orka = false;
Rhino = false;
Storch = false;
Tuna = false;
Samen = false;
Baum = false;



if (Vagabund) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Vagabund.svg", center = true, dpi = 96);

};

if (Horst) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Horst.svg", center = true, dpi = 96);

};

if (Lizard) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Lizard.svg", center = true, dpi = 96);

};

if (BlueAgent) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("BlueAgent.svg", center = true, dpi = 96);

};
if (Spion) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Spion.svg", center = true, dpi = 96);

};

module Frontwand() {
    color("White")
    rotate([90,0,0])
    translate([150/2,75/2,0])
    linear_extrude(height=5, convexity = 10)
    import("Frontwand.svg", center = true, dpi = 96);
}

module Backwand() {
    color("White")
    rotate([90,0,0])
    translate([150/2,75/2,0])
    linear_extrude(height=5, convexity = 10)
    import("Backwand.svg", center = true, dpi = 96);
}

module Seitenwand() {
    color("White")
    rotate([90,0,0])
    translate([150/2,75/2,0])
    linear_extrude(height=5, convexity = 10)
    import("Seitenwand.svg", center = true, dpi = 96);
}


if (Haus) {
    rotate([0,0,90])
    translate([-80/2+5/2,0,0])
    Frontwand();

    rotate([0,0,90])
    translate([-80/2+5/2,-150+5,0])
    Backwand();

    translate([0,0,0])
    Seitenwand();
    translate([0,80,0])
    Seitenwand();    
}

if (Gorilla) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Gorilla.svg", center = true, dpi = 96);

};
if (Antilope) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Antelope.svg", center = true, dpi = 96);

};


if (Gepard) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Gepard.svg", center = true, dpi = 96);

};

if (Sockel) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=1,center = true, convexity = 10)
    import("Sockel.svg", center = true, dpi = 96);

};

if (Shark) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Shark.svg", center = true, dpi = 96);

};

if (Elephant) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("Elephant.svg", center = true, dpi = 96);

};

if (Hippo) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("hippopotamus.svg", center = true, dpi = 96);

};

if (Leopard) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("leopard.svg", center = true, dpi = 96);

};

if (Lion) {
    scale([0.1,0.1,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("lion.svg", center = true, dpi = 96);

};

if (Seekuh) {
    scale([0.2,0.2,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("manatee.svg", center = true, dpi = 96);

};

if (Orka) {
    scale([0.2,0.2,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("orca.svg", center = true, dpi = 96);

};

if (Rhino) {
    scale([0.2,0.2,0.1])
    linear_extrude(height=50,center = true, convexity = 10)
    import("rhino.svg", center = true, dpi = 96);

};

if (Storch) {

        scale([0.2,0.2,0.1])
        linear_extrude(height=50,center = true, convexity = 10)
        import("Storch.svg", center = true, dpi = 96);
 
};

if (Tuna) {

        scale([0.1,0.1,0.1])
        linear_extrude(height=50,center = true, convexity = 10)
        import("tuna.svg", center = true, dpi = 96);
 
};

if (Samen) {

        scale([0.1,0.1,0.1])
        linear_extrude(height=50,center = true, convexity = 10)
        import("Samen.svg", center = true, dpi = 96);
 
};

if (Baum) {

        scale([0.1,0.1,0.02])
        linear_extrude(height=50,center = true, convexity = 10)
        import("Baum.svg", center = true, dpi = 96);
 
};



