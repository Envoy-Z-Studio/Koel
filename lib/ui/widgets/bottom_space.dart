import 'package:flutter/cupertino.dart';

class BottomSpace extends StatelessWidget {
  final double height;
  final bool asSliver;

  const BottomSpace({
    super.key,
    this.height = 160,
    this.asSliver = true,
  });

  @override
  Widget build(BuildContext context) {
    return asSliver
        ? SliverToBoxAdapter(child: SizedBox(height: height))
        : SizedBox(height: height);
  }
}
