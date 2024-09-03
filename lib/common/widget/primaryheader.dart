import 'package:flutter/material.dart';
import 'package:moneymentor/common/widget/shapes/shape.dart';
import 'package:moneymentor/utils/constants/colors.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: CircularConatiner(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -150,
              child: CircularConatiner(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
