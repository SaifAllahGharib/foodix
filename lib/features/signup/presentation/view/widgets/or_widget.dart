import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class Or extends StatelessWidget {
  const Or({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 2)),
        const SizedBox(width: 7),
        Text("or", style: context.textStyle.s15W400),
        const SizedBox(width: 7),
        const Expanded(child: Divider(thickness: 2)),
      ],
    );
  }
}
