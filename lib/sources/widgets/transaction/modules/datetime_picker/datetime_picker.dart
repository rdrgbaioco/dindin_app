import 'package:dindin_app/library.dart';

class PickerDateTime extends StatefulWidget {
  final ValueNotifier<DateTime> dateNotifier;
  const PickerDateTime({
    Key? key,
    required this.dateNotifier,
  }) : super(key: key);

  @override
  State<PickerDateTime> createState() => _PickerDateTimeState();
}

class _PickerDateTimeState extends State<PickerDateTime> {

  final _dateController = TextEditingController();

  @override
  void initState() {
    _dateController.text = getDateTime(widget.dateNotifier.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final focus = FocusScope.of(context);
    return ValueListenableBuilder(
        valueListenable: widget.dateNotifier,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    'Data',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.inversePrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () async {
                  focus.unfocus();
                  DateTime? date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2021, 01, 01),
                    initialDate: widget.dateNotifier.value,
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    widget.dateNotifier.value = date;
                    _dateController.text = getDateTime(widget.dateNotifier.value);
                  }
                },
                onLongPress: () {
                  widget.dateNotifier.value = DateTime.now();
                  _dateController.text = "Hoje";
                },
                child: TextFormField(
                  enabled: false,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.inversePrimary,
                  ),
                  decoration: InputDecoration(
                    //filled: true,
                    //fillColor: theme.colorScheme.primaryContainer,
                    suffixIcon: Icon(
                      Icons.edit_calendar,
                      color: theme.colorScheme.inversePrimary,
                      size: 25,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 20,
                      top: 20,
                    ),
                    focusColor: theme.colorScheme.primary,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: theme.colorScheme.inversePrimary,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: theme.colorScheme.error,
                        width: 2,
                      ),
                    ),
                    disabledBorder:  OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                        color: theme.colorScheme.inversePrimary,
                        width: 1,
                      ),
                    ),
                    errorStyle: TextStyle(color: theme.colorScheme.error),
                  ),
                  controller: _dateController,
                  validator: (value) => value == null || value == '' ? 'Campo Obrigatório' : null,
                ),
              ),
            ],
          );
        }
    );
  }

  String getDateTime(DateTime? dateTime) {
    final difference = DateTime.now().difference(dateTime!).inDays;
    if (difference < 1) {
      _dateController.text = "Hoje";
      return "Hoje";
    } else {
      String day = dateTime.day.toString().padLeft(2,"0");
      String month = dateTime.month.toString().padLeft(2,"0");
      int year = dateTime.year;
      _dateController.text = "$day/$month/$year";
      return "$day/$month/$year";
    }
  }
}