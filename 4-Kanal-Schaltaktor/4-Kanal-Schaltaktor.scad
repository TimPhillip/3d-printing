// 4 Kanal Schaltaktor mit Bateriebetrieb

// Platine
PX = 60;
PY = 72;
PZ = 25;

// Relaise
RX = 73;
RY = 53;
RZ = 25;

// Box
BX = PX + 40;
BY = PY + 80;
BZ = PZ + 40;

// Wandstärke
W = 2;

// ----------------------------

module Deckel() {
    translate([0,0,10])
    difference() {
        translate([0,0,BZ/2])
        cube([BX+4*W,BY+4*W, 10],center=true);
        scale([1.02,1.02,1]) Outer();
        translate([0,0,10])
        DeckelLocher();
    }
    translate([0,0,BZ+6])
    RelaiseHalterung();
}

module RelaiseSaulen() {
    R = 3;  // Abstand vom Rand
    translate([(RX/2-R),(RY/2-R),0])
    PCBSaule();
    translate([-(RX/2-R),(RY/2-R),0])
    PCBSaule();
    translate([(RX/2-R),-(RY/2-R),0])
    PCBSaule();
    translate([-(RX/2-R),-(RY/2-R),0])
    PCBSaule();
}

module RelaiseHalterung() {
    difference() {
        RelaiseSaulen();
        translate([0,0,-PZ])
        RelaiseLocher();
    }
}


module AnschlussHole() {
    translate([BX/2,0,BZ/2-20])
    rotate([0,90,0])
    cylinder(d=8,h=20,center=true,$fn=40);
}


module AnschlussHoles() {
    translate([0,-BY/2+30,0])
    AnschlussHole();
    translate([0,-BY/2+60,0])
    AnschlussHole();
    translate([0,BY/2-60,0])
    AnschlussHole();
    translate([0,BY/2-30,0])
    AnschlussHole();
    
    translate([-BX,0,-20])
    AnschlussHole();
    
    
}

module Deckelhalterung() {
    difference() {
        DeckelSaulen();
        translate([0,0,4])
        DeckelLocher();
    }
}

module DeckelSaule() {
    translate([0,0,0])
    cylinder(d=8,h=BZ-4,center=true,$fn=40);
}

module DeckelSaulen() {
    R = 4; // Abstand vom Rand
    translate([(BX/2-R),(BY/2-R),0])
    DeckelSaule();
    translate([-(BX/2-R),(BY/2-R),0])
    DeckelSaule();
    translate([(BX/2-R),-(BY/2-R),0])
    DeckelSaule();
    translate([-(BX/2-R),-(BY/2-R),0])
    DeckelSaule();
}
module DeckelLoch() {
    cylinder(d=2,h=BZ+4,center=true,$fn=40);
}

module DeckelLocher() {
    R = 4; // Abstand vom Rand
    translate([(BX/2-R),(BY/2-R),0])
    DeckelLoch();
    translate([-(BX/2-R),(BY/2-R),0])
    DeckelLoch();
    translate([(BX/2-R),-(BY/2-R),0])
    DeckelLoch();
    translate([-(BX/2-R),-(BY/2-R),0])
    DeckelLoch();
}

module PCBHalterung() {
    difference() {
        PCBSaulen();
        translate([0,0,-PZ])
        PCBLocher();
    }
}

module PCBSaule() {
    PCBHoehe=6;
    translate([0,0,-BZ/2+3])
    cylinder(d=8,h=PCBHoehe,center=true,$fn=40);
}

module PCBSaulen() {
    R = 3;  // Abstand vom Rand
    translate([(PX/2-R),(PY/2-R),0])
    PCBSaule();
    translate([-(PX/2-R),(PY/2-R),0])
    PCBSaule();
    translate([(PX/2-R),-(PY/2-R),0])
    PCBSaule();
    translate([-(PX/2-R),-(PY/2-R),0])
    PCBSaule();
}

module PCBLoch() {
    cylinder(d=2,h=PZ+4,center=true,$fn=40);
}

module PCBLocher() {
    R = 3;  // Abstand vom Rand
    translate([(PX/2-R),(PY/2-R),0])
    PCBLoch();
    translate([-(PX/2-R),(PY/2-R),0])
    PCBLoch();
    translate([(PX/2-R),-(PY/2-R),0])
    PCBLoch();
    translate([-(PX/2-R),-(PY/2-R),0])
    PCBLoch();
}

module HMPCB() {
    PCBHoehe=6;
    translate([0,0,-BZ/2+PZ/2+PCBHoehe])
    difference() {
        cube([PX,PY,PZ],center=true);
        PCBLocher();
    }
}

module RelaiseLocher() {
    R = 3;  // Abstand vom Rand
    translate([(RX/2-R),(RY/2-R),0])
    PCBLoch();
    translate([-(RX/2-R),(RY/2-R),0])
    PCBLoch();
    translate([(RX/2-R),-(RY/2-R),0])
    PCBLoch();
    translate([-(RX/2-R),-(RY/2-R),0])
    PCBLoch();
}


module Relaise() {
    PCBHoehe=6;
//    rotate([90,0,0])
//    translate([0,0,BY/2-RZ/2-PCBHoehe])
    difference() {
        cube([RX,RY,RZ],center=true);
        RelaiseLocher();
    }
}



module BLoch() {
    cylinder(d=3,h=BZ+4,center=true,$fn=40);
}

module Befestigungslocher() {
    R = 12;  // Abstand vom Rand
    translate([(BX/2-R),(BY/2-R),0])
    BLoch();
    translate([-(BX/2-R),(BY/2-R),0])
    BLoch();
    translate([(BX/2-R),-(BY/2-R),0])
    BLoch();
    translate([-(BX/2-R),-(BY/2-R),0])
    BLoch();
}


module Outer() {
    minkowski() {
        cube([BX,BY,BZ],center=true);
        sphere(r=1);
    }
}


module Inner() {
    translate([0,0,W])
    cube([BX-W,BY-W,BZ],center=true);
}


module Box() {
    difference() {
        Outer();
        Inner();
        Befestigungslocher();
        AnschlussHoles();
    }
    PCBHalterung();
    Deckelhalterung();
}



//Box();
//%HMPCB();
//%Relaise();
Deckel();