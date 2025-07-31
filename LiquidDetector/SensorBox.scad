box_length = 65;
box_width = 20;
box_height = 10;

show_box = true;
show_head = false;

module box(){
difference(){
    minkowski(){
        cube([box_length,box_width,box_height]);
        sphere(r = 2);
    }
    cube([box_length,box_width,box_height * 2]);
    rotate([0,90,0])
    translate([- box_height / 2,box_width / 2,0])
    cylinder(r = 3, h= 200, center = true);
    
    translate([-50,-50, box_height])
    cube([200,200,100]);
}

translate([(box_length - 60) / 2,(box_width - 10) / 2,(box_height - 5) / 2])
%cube([60,10,5]);

translate([2,2,0])
for (i = [0,1,2,3]){
   translate((i % 2) == 0 ? [box_length - 4,0,0] : [0,0,0]){
   translate((i >= 2) ? [0,box_width - 4,0] : [0,0,0])
   screw_mount(outer= 2.5, inner= 1.5);}
}
}

module screw_mount(outer, inner){

difference(){
cylinder(h= box_height, r= outer);
translate([0,0,box_height / 5])    
cylinder(h= box_height + 1, r= inner, $fn=8);   
}    

}

module head(){
  difference(){
    minkowski(){
        translate([0,0,-1])
        cube([box_length,box_width,1]);
        sphere(r = 2);
    }
    
    translate([-50,-50, -100])
    cube([200,200,100]);
    
    translate([0,box_width / 4, -99])
    cube([box_length,box_width / 2,100]);
    
    translate([box_length / 6,box_width / 8,-99])
    cube([box_length * 4 / 6,box_width * 6 / 8,100]);
    
    translate([2,2,0])
    for (i = [0,1,2,3]){
       translate((i % 2) == 0 ? [box_length - 4,0,0] : [0,0,0]){
       translate((i >= 2) ? [0,box_width - 4,0] : [0,0,0]){
           translate([0,0,0.5])
       cylinder(r = 2.5, h = 20, center= false, $fn= 20);
       cylinder(r = 1.5, h = 20, center= true, $fn= 20);}}
    }
}  
}

if (show_box){
    box();
}

if (show_head){
translate([0,0,box_height])
head();    
}