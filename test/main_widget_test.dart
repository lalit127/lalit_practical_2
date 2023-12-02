import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lalit_practical/main.dart';


void main(){
  testWidgets('Check TextField',(WidgetTester tester) async{
    await tester.pumpWidget(MyApp());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'Hello');
    expect(find.text('text'), findsOneWidget);
  });}