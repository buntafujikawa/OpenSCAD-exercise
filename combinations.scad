translate([-40, 0,0])
union() {cube(12, center=true); sphere(8);} // cube or  sphere

translate([-20, 0,0])
difference() {cube(12, center=true); sphere(8);} // cube and not sphere

translate([0, 0,0])
difference() {sphere(8); cube(12, center=true);} // sphere and not cube

translate([20, 0,0])
intersection() {cube(12, center=true); sphere(8);} // cube and sphere

difference() {
    translate([40, 0, 0])
    cube(12, center=true); 
    translate([40, -1, 0])
    cube(11, center=true);
}

union() {
    translate([60, 0, 0])
    cube([15, 2, 2], center=true); 

    translate([60, 0, 0])
    cube([2,2,15], center=true); 
}