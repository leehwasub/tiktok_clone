import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

void main() {
  group("From Button Tests", () {
    testWidgets("Enabled State", (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: const FormButton(disabled: false),
        ),
      );
      expect(find.text("Next"), findsOneWidget);
      expect(
          tester
              .firstWidget<AnimatedDefaultTextStyle>(
                  find.byType(AnimatedDefaultTextStyle))
              .style
              .color,
          Colors.white);
    });

    testWidgets("Disabled State", (WidgetTester tester) async {
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: const FormButton(disabled: true),
        ),
      );
      expect(find.text("Next"), findsOneWidget);
      expect(
          tester
              .firstWidget<AnimatedDefaultTextStyle>(
                  find.byType(AnimatedDefaultTextStyle))
              .style
              .color,
          Colors.grey.shade400);
    });

    testWidgets("Disabled State DarkMode", (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            platformBrightness: Brightness.dark,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: const FormButton(disabled: true),
          ),
        ),
      );
      expect(
          (tester
                  .firstWidget<AnimatedContainer>(
                      find.byType(AnimatedContainer))
                  .decoration as BoxDecoration)
              .color,
          Colors.grey.shade800);
    });

    testWidgets("Disabled State Light Mode", (WidgetTester tester) async {
      await tester.pumpWidget(
        MediaQuery(
          data: MediaQueryData(
            platformBrightness: Brightness.light,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: const FormButton(disabled: true),
          ),
        ),
      );
      expect(
          (tester
                  .firstWidget<AnimatedContainer>(
                      find.byType(AnimatedContainer))
                  .decoration as BoxDecoration)
              .color,
          Colors.grey.shade300);
    });
  });
}
