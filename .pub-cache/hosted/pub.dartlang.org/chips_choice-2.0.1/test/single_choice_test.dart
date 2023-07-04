import 'package:flutter_test/flutter_test.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

void main() {

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];

  // setUp(() {
  //   value = null;
  // });

  testWidgets('choice items and the initial value displayed correctly', (WidgetTester tester) async {
    int selectedValue;

    final c2Widget = ChipsChoice<int>.single(
      value: selectedValue,
      onChanged: (val) {
        print('print selecetesl lsa');
        selectedValue = val;
      },
      choiceItems: C2Choice.listFrom<int, String>(
        source: options,
        value: (i, v) => i,
        label: (i, v) => v,
      ),
    );

    await tester.pumpWidget(Bootstrap(child: c2Widget));
    await tester.pumpAndSettle();

    final c2Finder = find.byWidget(c2Widget);
    expect(c2Finder, findsOneWidget);

    // expect available choice items displayed correctly
    final choiceFinder = find.descendant(
      of: c2Finder,
      matching: find.byWidgetPredicate((widget) => widget is RawChip && widget.selected == false)
    );
    expect(choiceFinder, findsNWidgets(11));

    // select a choice
    final selectionFinder = find.descendant(
      of: c2Finder,
      matching: find.widgetWithText(RawChip, 'Travel')
    );
    expect(selectionFinder, findsNWidgets(1));

    // Tap the widget
    await tester.tap(selectionFinder);
    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // expect available choice items displayed correctly
    // final selectedFinder = find.descendant(
    //   of: c2Finder,
    //   matching: find.byWidgetPredicate((widget) => widget is RawChip && widget.selected == true)
    // );
    // expect(selectedFinder, findsNWidgets(1));

    // expect new value options[7] = Travel
    // expect(selectedValue, 7);
  });
}

class Bootstrap extends StatelessWidget {
  final Widget child;

  const Bootstrap({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChipsChoice Test',
      home: Scaffold(
        body: child,
      ),
    );
  }
}