import 'package:flutter/material.dart';
import 'package:tabnews/core/mixin/theme_mixin.dart';
import 'package:tabnews/core/widgets/icon_widget.dart';
import 'package:tabnews/core/widgets/spacer_widget.dart';
import 'package:tabnews/core/widgets/text_widget.dart';
import 'package:tabnews/core/widgets/touchable_widget.dart';

class IconButtonWidget extends StatelessWidget with ThemeMixin {
  const IconButtonWidget({
    required this.icon,
    this.isFilled = false,
    this.label,
    this.iconSize,
    this.padding,
    this.color,
    this.onPressed,
    super.key,
  });

  final IconData icon;
  final bool isFilled;
  final String? label;
  final double? iconSize;
  final EdgeInsets? padding;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = getColors();
    final metrics = getMetrics();

    final iconWidget = IconWidget(icon, size: iconSize);

    final child = Visibility(
      visible: label != null,
      replacement: iconWidget,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const SpacerWidget(
            direction: Axis.horizontal,
            size: SpacerWidgetSizes.small,
          ),
          if (label != null) TextWidget(label!),
        ],
      ),
    );

    return TouchableWidget(
      onPressed: onPressed,
      child: Visibility(
        visible: isFilled,
        replacement: child,
        child: Container(
          padding: padding ?? EdgeInsets.all(metrics.medium),
          decoration: BoxDecoration(
            color: color ?? colors.primary,
            border: Border.fromBorderSide(metrics.border),
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
