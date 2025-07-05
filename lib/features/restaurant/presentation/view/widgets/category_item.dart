import 'package:flutter/material.dart';  
import 'package:foodix/core/utils/extensions.dart';  

class CategoryItem extends StatefulWidget {
  final String text;
  final bool selected;

  const CategoryItem({super.key, required this.text, required this.selected});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  late TextPainter _textPainter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTextPainter();
  }

  @override
  void didUpdateWidget(covariant CategoryItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _updateTextPainter();
    }
  }

  void _updateTextPainter() {
    _textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: context.textStyle.s15W400.copyWith(
          color: widget.selected ? Colors.black : Colors.grey,
        ),
      ),
      textDirection: Directionality.of(context),
    )..layout();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.responsive.width20),
          child: Text(
            widget.text,
            style: context.textStyle.s15W400.copyWith(
              fontWeight: FontWeight.w500,
              color: widget.selected ? Colors.black : Colors.grey,
            ),
          ),
        ),
        const Spacer(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeInOut,
          width: widget.selected
              ? _textPainter.width + context.responsive.width20 * 1.65
              : 0,
          height: context.responsive.height10 * 0.2,
          color: Colors.black,
        ),
      ],
    );
  }
}
