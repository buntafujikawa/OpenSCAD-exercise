// 三角柱
translate([-40, 0, 0]) // x,y,z
cylinder(h=20, r1=8, r2=8, $fn=3);

// 円錐
translate([-20, 0, 0])
cylinder(h=20, r1=10, r2=0); // height, radius

// 球体
translate([0, 0, 10])
sphere(10); // 球体の大きさ

// 立方体
translate([20, 0, 0])
cube(10); // 立方体の大きさ

// 生四角柱
translate([40, 0, 0])
cube([8, 15, 20]); // width,depth,height
