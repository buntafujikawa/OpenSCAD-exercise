translate([-20, 0,0])
union() {cube(12, center=true); sphere(8);} // cube or  sphere

translate([-20, 0, 20])
difference() {cube(12, center=true); sphere(8);} // cube and not sphere

translate([0, 0, 0])
difference() {sphere(8); cube(12, center=true);} // sphere and not cube

translate([0, 0, 20])
intersection() {cube(12, center=true); sphere(8);} // cube and sphere

difference() {
    translate([20, 0, 0])
    cube(12, center=true); 
    translate([20, -1, 0])
    cube(11, center=true);
}

union() {
    translate([20, 0, 20])
    cube([15, 2, 2], center=true); 

    translate([20, 0, 20])
    cube([2,2,15], center=true); 
}

// 台形
key_bottom_size = 18;
key_top_size    = 14;
key_top_height  = 8;

translate([40, 10, key_top_height])
hull () {
    translate([0, 0, key_top_height])
    cube([key_top_size, key_top_size, 0.01], center = true);
    cube([key_bottom_size, key_bottom_size, 0.01], center = true);
}
