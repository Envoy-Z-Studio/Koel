import 'package:app/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class CirclePlaceholder extends StatelessWidget {
  final double size;

  const CirclePlaceholder({
    super.key,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
