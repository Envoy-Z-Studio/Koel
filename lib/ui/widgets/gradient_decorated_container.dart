import 'package:flutter/material.dart';

class GradientDecoratedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const GradientDecoratedContainer(
      {super.key, this.child = const SizedBox.expand(), this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.webp'),
          fit: BoxFit.cover,
          alignment: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}
