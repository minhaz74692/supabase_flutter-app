import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.widget,
      required this.title,
      this.color,
      required this.onPressed,
      this.style,
      this.borderRadius,
      this.elevation,
      this.horizontalPadding,
      this.verticlaPadding,
      this.borderWidth,
      this.borderColor});
  final String title;
  final Color? color;
  final Function onPressed;
  final TextStyle? style;
  final double? borderRadius;
  final double? elevation;
  final double? horizontalPadding;
  final double? verticlaPadding;
  final Widget? widget;
  final double? borderWidth;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: borderWidth != null
            ? BorderSide(
                width: borderWidth!,
                color: borderColor != null ? borderColor! : Colors.white,
              )
            : null,
        elevation: elevation ?? 0,
        backgroundColor: color ?? const Color(0xFF0052A1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0,
          vertical: verticlaPadding ?? 0,
        ),
        child: widget ??
            Text(
              title,
              style: style != null
                  ? style!.copyWith(letterSpacing: 0)
                  : GoogleFonts.roboto(
                      color: Colors.white,
                      letterSpacing: 0,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
            ),
      ),
    );
  }
}
