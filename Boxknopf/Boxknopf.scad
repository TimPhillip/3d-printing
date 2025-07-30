// Boxknopf
$fn=60;

rotate_extrude(convexity = 2) {
    rotate([180,0,180])
    translate([-121.5,245,0])
    import("Knopf.svg");
}
