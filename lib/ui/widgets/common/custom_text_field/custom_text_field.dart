import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final BoxConstraints? prefixConstraints;
  final BoxConstraints? suffixConstraints;
  final int? maxLines;
  final bool? obscure;
  final String? errorText;
  final double? borderRadius;
  final bool? enabled;
  final double? fontSize;
  final String? label;
  final int? maxLength;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool disableBorder;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Color? fillColor;
  final Color? focusColor;
  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputType,
    this.obscure = false,
    this.enabled = true,
    this.validator,
    this.prefix,
    this.suffix,
    this.prefixConstraints,
    this.suffixConstraints,
    this.borderRadius = 30,
    this.maxLines = 1,
    this.errorText,
    this.fontSize = 14.0,
    this.label,
    this.maxLength,
    this.onSaved,
    this.onTap,
    this.disableBorder = false,
    this.onChanged,
    this.textInputAction,
    this.onFieldSubmitted,
    this.fillColor = AppColors.kBackgoundColor,
    this.focusColor = AppColors.kWhiteColor,
  }) : super(key: key);
  @override
  Widget builder(
      BuildContext context, CustomTextFieldModel viewModel, Widget? child) {
    return ValueListenableBuilder(
      valueListenable: viewModel.myFocusNotifier,
      builder: (context, isFocus, child) {
        return TextFormField(
          focusNode: viewModel.myFocusNode,
          onChanged: (value) {
            viewModel.showErrorMessage = true;
            onChanged?.call(value);
          },
          onTap: onTap,
          onSaved: onSaved,
          cursorColor: AppColors.kPrimaryColor,
          enabled: enabled,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          maxLines: maxLines,
          keyboardType: textInputType,
          obscureText: obscure!,
          obscuringCharacter: '●',
          maxLength: maxLength,
          style: Theme.of(context).textTheme.labelLarge,
          validator: validator,
          decoration: InputDecoration(
            errorText: viewModel.showErrorMessage ? errorText : null,
            // contentPadding: EdgeInsets.only(top: 16, left: 16, bottom: 16),
            labelText: label,
            fillColor: isFocus ? focusColor : fillColor,
            filled: true,
            counter: const Offstage(),
            prefixIconConstraints: prefixConstraints,
            prefixIcon: prefix != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: prefix!,
                  )
                : null,
            suffixIcon: suffix != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: suffix,
                  )
                : null,
            suffixIconConstraints: suffixConstraints,
            focusedBorder: DecoratedInputBorder(
              child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
            enabledBorder: DecoratedInputBorder(
              child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            disabledBorder: DecoratedInputBorder(
              child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
            ),
            border: DecoratedInputBorder(
              child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            errorBorder: DecoratedInputBorder(
              child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(
                  color: AppColors.kErrorColor,
                ),
              ),
            ),
            errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.kErrorColor,
                ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 18.h,
            ),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.kGreyColor,
                ),
            labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: AppColors.kGreyColor,
                ),
          ),
        );
      },
    );
  }

  @override
  CustomTextFieldModel viewModelBuilder(BuildContext context) {
    return CustomTextFieldModel();
  }
}
