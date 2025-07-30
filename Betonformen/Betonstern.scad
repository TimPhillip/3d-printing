// Betonstern

difference() {


    translate ([0,2.8,-1]) import("D:/Programme/OpenSCAD/Things/Betonformen/Simon Cat.stl", convexity=3);
    
};

translate ([10,30/2,0]) color ("Blue") cube ([20,30,53],center=true);

translate ([-10,30/2,0]) color ("Green") cube ([20,30,53],center=true);
