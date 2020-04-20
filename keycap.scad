$fs = 0.1; // minimum size
$fa = 0.25; // minimum angle    

stem_outer_size   = 5.5;
stem_cross_length = 4.0;
stem_cross_h      = 1.25;
stem_cross_v      = 1.10;

module stem () {
    difference () {
        cylinder(d = stem_outer_size, h = 15);
        // 十字部分
        translate([- stem_cross_h / 2, - stem_cross_length / 2, 0])
        cube([stem_cross_h, stem_cross_length, 15]);
        translate([- stem_cross_length / 2, - stem_cross_v / 2, 0])
        cube([stem_cross_length, stem_cross_v, 15]);
    }      
}


module rounded_cube (size, r) {
  h = 0.0001;
  minkowski () {
    cube([size[0] - r*2, size[1] - r*2, size[2] - h], center = true);
    cylinder(r = r, h = h);
  }
}

function dish_r(w, d) = (w * w + 4 * d * d) / (8 * d);

module keycap_outer_shape (key_bottom_size, key_top_size, key_top_height, angle, dish_depth) {
    difference () {
        hull () {
            translate([0, 0, key_top_height])
            
            // 傾ける
            rotate([- angle, 0, 0])
            
            // 薄い四角形を作成
            // cube([key_top_size, key_top_size, 0.01], center = true);
            // cube([key_bottom_size, key_bottom_size, 0.01], center = true);
            rounded_cube([key_top_size, key_top_size, 0.01], 3);
            rounded_cube([key_bottom_size, key_bottom_size, 0.01], 0.5);
        }
        
        // 窪みをつける(内側の窪みは不要では？)
        translate([0, 0, key_top_height])
        rotate([- angle, 0, 0])
        translate([0, 0, dish_r(key_top_size, dish_depth) - dish_depth])
        rotate([90, 0, 0])
        cylinder(r = dish_r(key_top_size, dish_depth), h = 60, center = true);
    }

}

module keycap_shape () {
    difference () {
        keycap_outer_shape(18, 14, 8, 10, 1);
        // 一回り小さい空白用
        keycap_outer_shape(15, 11, 6.5, 10, 1);
    }
}    

intersection () {
    keycap_outer_shape(18, 14, 8, 10, 2);
    stem();
}
keycap_shape();
