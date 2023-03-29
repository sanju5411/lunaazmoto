import 'package:flutter/material.dart';
import 'package:lunaaz_moto/constants/global_variables.dart';


enum Variant {
  primary,
  secondary,
  basic,
  white,
  cancel,
  edit,
  delete,
  success,
  outline,
  flat
}

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? textWidget;
  final VoidCallback onTap;
  final Variant variant;
  final bool loading;
  final double height;
  final bool enabled;
  final IconData? icon;
  final Widget? iconWidget;
  const CustomButton({
    Key? key,
    this.text,
    this.textWidget,
    required this.onTap,
    this.variant = Variant.basic,
    this.loading = false,
    this.height = 45,
    this.enabled = true,
    this.icon,
    this.iconWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onTap : () {},
      style: ElevatedButton.styleFrom(
        primary: enabled ? buttonBackground() : Colors.grey.shade300,
        elevation: enabled ? 5 : 0,
        minimumSize: Size(double.infinity, height),
        padding: EdgeInsets.zero,
        side: BorderSide(
          width: variant == Variant.flat ? 0 : 2.0,
          color:
          variant == Variant.outline ? loaderColor() : buttonBackground(),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget ??
              (icon != null
                  ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  icon,
                  color: loaderColor(),
                ),
              )
                  : Container()),
          loading
              ? CircularProgressIndicator(
            strokeWidth: 3,
            color: loaderColor(),
          )
              : textWidget ??
              Text(
                text ?? "Click",
                style: textStyle(),
              ),
        ],
      ),
    );
  }

  Color buttonBackground() {
    switch (variant) {
      case Variant.white:
        return CustomColor.whiteColor;
      case Variant.basic:
      case Variant.primary:
        return CustomColor.primaryColor;
      case Variant.secondary:
        return CustomColor.secondaryColor;
      case Variant.cancel:
        return CustomColor.backgroundDarkColor;
      case Variant.edit:
        return CustomColor.editColor;
      case Variant.delete:
        return CustomColor.errorColor;
      case Variant.success:
        return CustomColor.successColor;
      case Variant.outline:
        return CustomColor.whiteColor;
      case Variant.flat:
        return Colors.transparent;
    }
  }

  Color loaderColor() {
    switch (variant) {
      case Variant.white:
        return CustomColor.primaryColor;
      case Variant.secondary:
        return CustomColor.accentColor;
      case Variant.basic:
      case Variant.primary:
      case Variant.cancel:
      case Variant.edit:
      case Variant.delete:
        return CustomColor.whiteColor;
      case Variant.success:
        return CustomColor.successColor;
      case Variant.outline:
      case Variant.flat:
        return CustomColor.primaryColor;
    }
  }

  TextStyle textStyle() {
    switch (variant) {
      case Variant.white:
        return CustomStyle.darkTextStyle;
      case Variant.basic:
        return CustomStyle.displayTextStyle.copyWith(
          color: CustomColor.whiteColor,
        );
      case Variant.secondary:
        return CustomStyle.secondaryTextStyle
            .copyWith(color: CustomColor.whiteColor);
      case Variant.primary:
      case Variant.cancel:
      case Variant.edit:
      case Variant.delete:
      case Variant.success:
        return CustomStyle.displayTextStyle
            .copyWith(color: CustomColor.whiteColor);
      case Variant.outline:
      case Variant.flat:
        return CustomStyle.displayTextStyle;
    }
  }
}

class CustomCircularIconButton extends StatelessWidget {
  final IconData? icon;
  final Widget? iconWidget;
  final VoidCallback onTap;
  final Variant variant;
  final bool loading;
  final double radius;
  final bool enabled;
  final double progressValue;
  final bool hideProgress;
  final Widget? textWidget;
  final String? text;
  const CustomCircularIconButton({
    Key? key,
    this.textWidget,
    this.text,
    this.icon,
    this.iconWidget,
    required this.onTap,
    this.variant = Variant.basic,
    this.loading = false,
    this.radius = 24,
    this.enabled = true,
    this.progressValue = 1 / 4,
    this.hideProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        hideProgress
            ? Container()
            : SizedBox(
          width: (radius * 2) + 5,
          height: (radius * 2) + 5,
          child: CircularProgressIndicator(
            value: progressValue,
            strokeWidth: 2,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: radius * 2,
              height: radius * 2,
              child: ElevatedButton(
                onPressed: enabled ? onTap : () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  primary: enabled ? buttonBackground() : Colors.grey.shade300,
                  elevation: enabled ? 5 : 0,
                ),
                child: loading
                    ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: loaderColor(),
                )
                    : iconWidget ??
                    Icon(
                      icon ?? Icons.add,
                      size: radius,
                      color: Colors.white,
                    ),
              ),
            ),
            textWidget ??
                (text != null
                    ? Text(
                  text ?? "Click",
                  style: textStyle(),
                )
                    : Container()),
          ],
        ),
      ],
    );
  }

  Color buttonBackground() {
    switch (variant) {
      case Variant.white:
        return CustomColor.whiteColor;
      case Variant.basic:
      case Variant.primary:
        return CustomColor.primaryColor;
      case Variant.secondary:
        return CustomColor.secondaryColor;
      case Variant.cancel:
        return CustomColor.backgroundDarkColor;
      case Variant.edit:
        return CustomColor.editColor;
      case Variant.delete:
        return CustomColor.errorColor;
      case Variant.success:
        return CustomColor.successColor;
      case Variant.outline:
        return Colors.white;
      case Variant.flat:
        return Colors.transparent;
    }
  }

  Color loaderColor() {
    switch (variant) {
      case Variant.white:
        return CustomColor.primaryColor;
      case Variant.secondary:
        return CustomColor.accentColor;
      case Variant.basic:
      case Variant.primary:
      case Variant.cancel:
      case Variant.edit:
      case Variant.delete:
        return CustomColor.whiteColor;
      case Variant.success:
        return CustomColor.successColor;
      case Variant.outline:
      case Variant.flat:
        return CustomColor.primaryColor;
    }
  }

  TextStyle textStyle() {
    switch (variant) {
      case Variant.white:
        return CustomStyle.darkTextStyle;
      case Variant.basic:
        return CustomStyle.displayTextStyle.copyWith(
          color: CustomColor.whiteColor,
        );
      case Variant.secondary:
        return CustomStyle.secondaryTextStyle
            .copyWith(color: CustomColor.whiteColor);
      case Variant.primary:
      case Variant.cancel:
      case Variant.edit:
      case Variant.delete:
      case Variant.success:
      case Variant.outline:
      case Variant.flat:
        return CustomStyle.displayTextStyle;
    }
  }
}
