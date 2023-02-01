import 'package:dindin_app/library.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final Icon? icon;
  final bool? isPassword;
  final bool? obscureChange;
  final bool? readOnly;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final void Function()? onTap;
  final void Function()? onChangeObscure;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextForm({Key? key,
    required this.controller,
    required this.textInputAction,
    required this.keyboardType,
    required this.labelText,
    this.inputFormatters,
    this.icon,
    this.isPassword,
    this.obscureChange,
    this.readOnly,
    this.maxLength,
    this.textCapitalization,
    this.autovalidateMode,
    this.initialValue,
    this.onChangeObscure,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Text(
              labelText,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            filled: false,
            icon: icon,
            suffixIcon: isPassword == true
                ? IconButton(icon: Icon(obscureChange!
                ? Icons.visibility
                : Icons.visibility_off_rounded,
              color: theme.colorScheme.tertiary,
            ), onPressed: onChangeObscure) : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.inversePrimary,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.inversePrimary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            ),
            // labelText: _labelText,
            // labelStyle: theme.textTheme.titleMedium?.copyWith(
            //   color: theme.colorScheme.inversePrimary,
            // ),
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            cut: true,
            paste: true,
            selectAll: true,
          ),
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary
          ),
          cursorColor: theme.colorScheme.primary,
          inputFormatters: inputFormatters,
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          autovalidateMode: autovalidateMode,
          autocorrect: true,
          initialValue: initialValue,
          maxLength: maxLength,
          obscuringCharacter: '*',
          obscureText: obscureChange ?? false,
          readOnly: readOnly ?? false,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          validator: validator,
        ),
      ],
    );
  }
}