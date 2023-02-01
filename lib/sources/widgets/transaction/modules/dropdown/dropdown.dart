import 'package:dindin_app/library.dart';

class CustomDropdownButton extends StatelessWidget {
  final IconData? iconLabel;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final List<DropdownMenuItem<Object>>? items;
  final Object? selectValue;
  final void Function(Object?)? onChanged;
  final String? Function(Object?)? validator;

  const CustomDropdownButton({
    Key? key,
    required this.selectValue,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.iconLabel,
    this.validator,
  })  : super(key: key);

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
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 40),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.inversePrimary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.inversePrimary,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: theme.colorScheme.inversePrimary,
                width: 2,
              ),
            ),
            isDense: true,
            icon: iconLabel == null ? null : Icon(
              iconLabel,
              color: theme.colorScheme.primary,
              size: 40,
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: theme.colorScheme.tertiary,
              size: 25,
            ) : null,
            suffixIcon: suffixIcon != null ? Icon(
              suffixIcon,
              color: theme.colorScheme.tertiary,
              size: 25,
            ) : null,
          ),
          borderRadius: BorderRadius.circular(5),
          elevation: 0,
          menuMaxHeight: 350,
          itemHeight: 60,
          icon: Icon(
            Icons.arrow_drop_down,
            color: theme.colorScheme.inversePrimary,
          ),
          alignment: Alignment.centerLeft,
          //dropdownColor: Colors.white70,
          items: items,
          value: selectValue,
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
