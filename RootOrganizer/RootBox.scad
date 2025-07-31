// Root Box

Box = true;
Cardholder = false;

Wand = 1.2;

B_innen = 33.0;
L_innen = 115.0;
H_aussen = 25.0;

Separator = false;
x_num = 1;
y_num = 1;


//

module root_box () {

    b = B_innen + 2*Wand;
    l = L_innen + 2*Wand;
    h = H_aussen;
    
    difference() {
        cube([b,l,h],center=true);
        translate([0,0,Wand])
        cube([B_innen,L_innen,h],center=true);
    };
    
    if (Separator) root_separator();
}

module root_holder() {
    
    difference() {
        root_box();
        translate([0,0,-H_aussen/2])
        cylinder(d=B_innen*0.75,h=2*Wand);

        translate([0,L_innen/2,Wand])
        cube([B_innen*0.75,2*Wand,H_aussen], center=true);
    }
}

module root_card_holder() {
    union() {
        root_holder();
        translate([B_innen+Wand,0,0]) root_holder();
    }
}


module root_separator() {
    
    x_off = B_innen / x_num;
    y_off = L_innen / y_num;
    
    for (i=[-L_innen/2:y_off:+L_innen/2]) {
        translate([0,i,0])
        cube([B_innen,Wand,H_aussen], center = true);
    }
    for (i=[-B_innen/2:x_off:+B_innen/2]) {
        translate([i,0,0])
        cube([Wand,L_innen,H_aussen], center = true);
    }
}

if (Box) root_box();

if (Cardholder) root_card_holder();
    

