import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atividadeavaliativa01/main.dart';
import 'package:atividadeavaliativa01/resultado_screen.dart';

void main() {
  testWidgets('Testa a navegação e interação no jogo Pedra, Papel, Tesoura', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Pedra, Papel, Tesoura'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    await tester.tap(
      find.byWidgetPredicate(
        (widget) =>
            widget is GestureDetector &&
            widget.child is Column &&
            widget.child != null,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(TelaResultado), findsOneWidget);
    expect(find.text('Escolha do APP'), findsOneWidget);
    expect(find.text('Sua Escolha'), findsOneWidget);

    expect(find.byType(Image), findsNWidgets(3));
  });
}
