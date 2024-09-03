import 'package:flutter/material.dart';
import 'package:moneymentor/utils/constants/colors.dart';

class CircularConatiner extends StatelessWidget {
  const CircularConatiner(
      {super.key,
      this.width = 300,
      this.height = 300,
      this.radius = 400,
      this.padding = 0,
      this.child,
      this.backgroundColor = TColors.white});

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}

class CustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final SecondfirstCurve = Offset(0, size.height - 20);
    final SecondlastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(SecondfirstCurve.dx, SecondfirstCurve.dy,
        SecondlastCurve.dx, SecondlastCurve.dy);

    final ThirdfirstCurve = Offset(size.width, size.height - 20);
    final ThirdlastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(ThirdfirstCurve.dx, ThirdfirstCurve.dy,
        ThirdlastCurve.dx, ThirdlastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}


class CurvedEdgeWidget extends StatelessWidget {
  const CurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
