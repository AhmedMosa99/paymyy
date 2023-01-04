import 'package:flutter/material.dart';

showSmoothDialog(
    {required Widget child, required BuildContext context, isDismiss = false}) {
  showGeneralDialog(
    barrierDismissible: isDismiss,
    barrierLabel: "Label",
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (c, a1, a2) => Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        child: child),
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}

Widget defaultFormField(
        {required TextEditingController? controller,
        required TextInputType? type,
        void Function(String? s)? onSubmit,
        void Function(String? s)? onChange,
        void Function()? onTap,
        double? writeFontSize,
        bool isPassword = false,
        FontWeight? fontWeight,
        String? suffixText,
        String? Function(String? s)? validate,
        String? label,
        bool autofocus = false,
        Widget? prefix,
        double? cursorHeight = 20,
        Widget? suffix,
        Widget? suffixIcon,
        TextAlign textAlign = TextAlign.start,
        TextAlignVertical? textAlignVertical = TextAlignVertical.center,
        void Function()? suffixPressed,
        bool isClickable = true,
        double focusBorderRadius = 4,
        double labelFontSize = 14,
        Color focusColor = Colors.grey,
        Key? key,
        Color? fillColor,
        Color? labelColor = const Color(0xff707070),
        void Function(String?)? onSaved,
        Color borderColor = Colors.grey,
        double borderRadius = 12,
        Color? writeTextColor,
        FocusNode? focusNode,
        void Function()? onEditingComplete,
        TextInputAction? textInputAction,
        void Function()? prefixPressed,
        int? minLines = 1,
        int? maxLines = 1,
        double borderWidth = 1.0,
        EdgeInsetsGeometry? contentPadding = const EdgeInsets.all(12),
        String? prefixText,
        TextStyle? hintStyle,
        Color? prefixIconColor,
        Color? cursorColor,
        Color? suffixIconColor,
        Color? suffixTextColor,
        double? suffixFontSize,
        FontWeight? suffixFontWeight,
        Color disableColor = const Color(0xFF000000),
        double disableBorderwidth = 1.0,
        double disableBorderRadius = 12,
        double cursorWidth = 2.0,
        String? hintText}) =>
    TextFormField(
      autofocus: autofocus,
      textAlignVertical: textAlignVertical,
      minLines: minLines,
      maxLines: maxLines,
      textAlign: textAlign,
      cursorHeight: cursorHeight,
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: TextStyle(
          color: writeTextColor,
          fontSize: writeFontSize,
          fontWeight: fontWeight),
      key: key,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      cursorColor: cursorColor,
      cursorWidth: cursorWidth,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: disableColor, width: disableBorderwidth),
            borderRadius: BorderRadius.circular(disableBorderRadius)),
        contentPadding: contentPadding,
        prefixText: prefixText,
        filled: fillColor == null ? false : true,
        fillColor: fillColor, focusColor: focusColor,
        hintText: hintText,
        hintStyle: hintStyle, prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        suffix: suffix,
        suffixText: suffixText,
        suffixStyle: TextStyle(
            color: suffixTextColor,
            fontSize: suffixFontSize,
            fontWeight: suffixFontWeight),
        // helperText: hintText, //go hiny up to field
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor),
            borderRadius: BorderRadius.circular(focusBorderRadius)),
        labelText: label,
        labelStyle: TextStyle(fontSize: labelFontSize, color: labelColor),
        prefixIcon: prefix != null
            ? InkWell(onTap: prefixPressed, child: prefix)
            : null,
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: suffixPressed,
                child: suffixIcon,
              )
            : null,
        enabled: false,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(focusBorderRadius))),
      ),
    );
