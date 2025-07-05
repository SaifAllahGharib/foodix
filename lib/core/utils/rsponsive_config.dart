import 'package:flutter/material.dart';

class ResponsiveConfig {
  final BuildContext context;
  final Size size;
  final double width;
  final double height;

  static const double designWidth = 375.0;
  static const double designHeight = 812.0;

  factory ResponsiveConfig.of(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ResponsiveConfig._(
      context: context,
      size: size,
      width: size.width,
      height: size.height,
    );
  }

  const ResponsiveConfig._({
    required this.context,
    required this.size,
    required this.width,
    required this.height,
  });

  double get screenHeight => height;

  double get screenWidth => height;

  // Scale factors based on design dimensions
  double get scaleWidth => width / designWidth;

  // Scale factors based on design dimensions
  double get scaleHeight => height / designHeight;

  // Average scale factor for both dimensions
  double get scale => (scaleWidth + scaleHeight) / 2;

  // Responsive function to scale values
  double r(double value) => value * scale;

  // Widths
  double get width5 => r(5);

  double get width10 => r(10);

  double get width15 => r(15);

  double get width20 => r(20);

  double get width25 => r(25);

  double get width30 => r(30);

  double get width35 => r(35);

  double get width40 => r(40);

  double get width45 => r(45);

  double get width50 => r(50);

  double get width55 => r(55);

  double get width60 => r(60);

  double get width65 => r(65);

  double get width70 => r(70);

  double get width75 => r(75);

  double get width80 => r(80);

  double get width85 => r(85);

  double get width90 => r(90);

  double get width95 => r(95);

  double get width100 => r(100);

  double get width105 => r(105);

  double get width110 => r(110);

  double get width115 => r(115);

  double get width120 => r(120);

  double get width125 => r(125);

  double get width130 => r(130);

  double get width135 => r(135);

  double get width140 => r(140);

  double get width145 => r(145);

  double get width150 => r(150);

  // Heights
  double get height2 => r(2);

  double get height3 => r(3);

  double get height5 => r(5);

  double get height6 => r(6);

  double get height8 => r(8);

  double get height10 => r(10);

  double get height12 => r(12);

  double get height15 => r(15);

  double get height20 => r(20);

  double get height25 => r(25);

  double get height30 => r(30);

  double get height35 => r(35);

  double get height40 => r(40);

  double get height45 => r(45);

  double get height47 => r(47);

  double get height50 => r(50);

  double get height55 => r(55);

  double get height60 => r(60);

  double get height65 => r(65);

  double get height70 => r(70);

  double get height75 => r(75);

  double get height80 => r(80);

  double get height85 => r(85);

  double get height90 => r(90);

  double get height95 => r(95);

  double get height96 => r(95);

  double get height100 => r(100);

  double get height104 => r(104);

  double get height105 => r(105);

  double get height110 => r(110);

  double get height115 => r(115);

  double get height117 => r(117);

  double get height120 => r(120);

  double get height125 => r(125);

  double get height130 => r(130);

  double get height135 => r(135);

  double get height140 => r(140);

  double get height145 => r(145);

  double get height150 => r(150);

  double get height221 => r(221);

  double get height312 => r(150);

  double get height650 => r(650);

  // Fonts
  double get fontSize8 => r(8);

  double get fontSize10 => r(10);

  double get fontSize11 => r(11);

  double get fontSize12 => r(12);

  double get fontSize14 => r(14);

  double get fontSize15 => r(15);

  double get fontSize16 => r(16);

  double get fontSize18 => r(18);

  double get fontSize19 => r(19);

  double get fontSize20 => r(20);

  double get fontSize22 => r(22);

  double get fontSize24 => r(24);

  double get fontSize26 => r(26);

  double get fontSize28 => r(28);

  double get fontSize30 => r(30);

  // Padding / Margin
  double get padding5 => r(5);

  double get padding8 => r(8);

  double get padding10 => r(10);

  double get padding12 => r(12);

  double get padding14 => r(14);

  double get padding15 => r(15);

  double get padding16 => r(16);

  double get padding18 => r(18);

  double get padding20 => r(20);

  double get padding24 => r(24);

  double get padding28 => r(28);

  double get padding30 => r(30);

  double get padding40 => r(40);

  // Radius
  double get radius8 => r(8);

  double get radius10 => r(10);

  double get radius12 => r(12);

  double get radius14 => r(14);

  double get radius15 => r(15);

  double get radius16 => r(16);

  double get radius18 => r(18);

  double get radius20 => r(20);

  double get radius24 => r(24);

  double get radius28 => r(28);

  double get radius30 => r(30);

  double get radius100 => r(100);

  // Icons
  double get iconSize8 => r(8);

  double get iconSize10 => r(10);

  double get iconSize12 => r(12);

  double get iconSize14 => r(14);

  double get iconSize15 => r(15);

  double get iconSize16 => r(16);

  double get iconSize18 => r(18);

  double get iconSize20 => r(20);

  double get iconSize24 => r(24);

  double get iconSize28 => r(28);

  double get iconSize30 => r(30);
}
