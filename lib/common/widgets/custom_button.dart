import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';

enum Variant { primary, secondary, basic, white, cancel ,booknowbtn,}

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? textWidget;
  final VoidCallback onTap;
  final Variant variant;
  final bool loading;
  final double height;
  final bool enabled;
  const CustomButton({
    Key? key,
    this.text,
    this.textWidget,
    required this.onTap,
    this.variant = Variant.basic,
    this.loading = false,
    this.height = 45,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        primary: enabled ? buttonBackground() : Colors.grey.shade300,
        elevation: enabled ? 5 : 0,
        minimumSize: Size(double.infinity, height),
      ),
      child: loading
          ? CircularProgressIndicator(
              strokeWidth: 3,
              color: loaderColor(),
            )
          : textWidget ??
              Text(
                text ?? "Click",
                style: textStyle(),
              ),
    );
  }

  Color buttonBackground() {
    switch (variant) {
      case Variant.white:
        return CustomColor.whiteColor;
      case Variant.booknowbtn:
        return CustomColor.booknowbtnColor;
      case Variant.basic:
        return CustomColor.primaryColor;
      case Variant.primary:
        return CustomColor.primaryColor;
      case Variant.secondary:
        return CustomColor.secondaryColor;
      case Variant.cancel:
        return CustomColor.backgroundDarkColor;
    }
  }

  Color loaderColor() {
    switch (variant) {
      case Variant.white:
        return CustomColor.primaryColor;
      case Variant.booknowbtn:
        return CustomColor.booknowbtnColor;
      case Variant.basic:
        return CustomColor.whiteColor;
      case Variant.primary:
        return CustomColor.whiteColor;
      case Variant.secondary:
        return CustomColor.accentColor;
      case Variant.cancel:
        return CustomColor.whiteColor;
    }
  }

  TextStyle textStyle() {
    switch (variant) {
      case Variant.white:
        return CustomStyle.darkTextStyle;
      case Variant.booknowbtn:
        return CustomStyle.darkTextStyle;
      case Variant.basic:
        return CustomStyle.displayTextStyle.copyWith(
          color: CustomColor.whiteColor,
        );
      case Variant.primary:
        return CustomStyle.displayTextStyle
            .copyWith(color: CustomColor.whiteColor);
      case Variant.secondary:
        return CustomStyle.secondaryTextStyle
            .copyWith(color: CustomColor.whiteColor);
      case Variant.cancel:
        return CustomStyle.displayTextStyle
            .copyWith(color: CustomColor.whiteColor);
    }
  }
}
