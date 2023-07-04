import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@Deprecated(
  "Deprecated static class functions in favor of top-level functions as recommended by Dart. Use `showPlatformDatePicker` and `showPlatformTimePicker` functions instead.",
)

/// A wrapper class for calling the show function
class PlatformDatePicker {
  /// A platform aware date picker function.
  ///
  /// It shows either the material date picker in the middle of the screen or a
  /// cupertino date picker from the bottom of the screen
  /// Returns the selected date.
  ///
  /// [showMaterial] forces the function to show the material calendar regardless
  /// of platform.
  ///
  /// [showCupertino] forces the function to show the cupertino calendar
  /// regardless of platform.
  ///
  /// [height] specifies the size of the cupertino date picker. It defaults to
  /// the bottom third of the screen.
  static Future<DateTime?> showDate({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
    Locale? locale,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    TextDirection? textDirection,
    TransitionBuilder? builder,
    DatePickerMode initialDatePickerMode = DatePickerMode.day,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    Key? key,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
    int minimumYear = 1,
    int? maximumYear,
    int minuteInterval = 1,
    bool use24hFormat = false,
    Color? backgroundColor,
    double? height,
    bool showMaterial = false,
    bool showCupertino = false,
  }) async {
    if ((Theme.of(context).platform == TargetPlatform.iOS && !showMaterial) ||
        showCupertino) {
      DateTime? keep;
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: height ?? MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              key: key,
              mode: mode,
              onDateTimeChanged: (date) => keep = date,
              backgroundColor: backgroundColor,
              initialDateTime: initialDate,
              minimumDate: firstDate,
              maximumDate: lastDate,
              minimumYear: minimumYear,
              maximumYear: maximumYear,
              minuteInterval: minuteInterval,
              use24hFormat: use24hFormat,
            ),
          );
        },
      );
      return keep;
    } else {
      return await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: builder,
        cancelText: cancelText,
        confirmText: confirmText,
        errorFormatText: errorFormatText,
        errorInvalidText: errorInvalidText,
        fieldHintText: fieldHintText,
        fieldLabelText: fieldLabelText,
        helpText: helpText,
        initialDatePickerMode: initialDatePickerMode,
        initialEntryMode: initialEntryMode,
        locale: locale,
        routeSettings: routeSettings,
        selectableDayPredicate: selectableDayPredicate,
        textDirection: textDirection,
        useRootNavigator: useRootNavigator,
      );
    }
  }

  static Future<TimeOfDay?> showTime({
    required BuildContext context,
    required TimeOfDay initialTime,
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Key? key,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.time,
    int minuteInterval = 1,
    bool use24hFormat = false,
    Color? backgroundColor,
    double? height,
    bool showCupertino = false,
    bool showMaterial = false,
  }) async {
    if ((Theme.of(context).platform == TargetPlatform.iOS && !showMaterial) ||
        showCupertino) {
      DateTime now = DateTime.now();
      TimeOfDay? keep;
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: height ?? MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoDatePicker(
              key: key,
              mode: mode,
              onDateTimeChanged: (date) => keep = TimeOfDay.fromDateTime(date),
              backgroundColor: backgroundColor,
              initialDateTime: DateTime(
                now.year,
                now.month,
                now.day,
                initialTime.hour,
                initialTime.minute,
              ),
              minuteInterval: minuteInterval,
              use24hFormat: use24hFormat,
            ),
          );
        },
      );
      return keep;
    } else {
      return await showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: builder,
        routeSettings: routeSettings,
        useRootNavigator: useRootNavigator,
      );
    }
  }
}
