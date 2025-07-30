// Cocktailmaker

use <Logo.scad>;

logo();


module logo() { 
    translate([9.0,-0.5,0]) 
    rotate([0,0,90])
    scale ([0.15,0.15,1]) 
    cocktail();

    translate([104/2,0,0]) 
    color("red")
    cube([104,1,2],center=true);

    color("red")
    linear_extrude(height = 2, center=true, convexity = 10, twist = 0)

    translate([15, 0]) 
        {
            text("CocktailMaker", font = "Liberation Sans:style=Bold Italic");
        }
     
 }
 
 module cocktail() {
    shape();
    liquid();
    stiel();
}