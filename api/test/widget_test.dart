// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:api/data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('displays nation data returned by the API', (tester) async {
    final client = MockClient((request) async {
      expect(request.url.host, 'datausa.io');
      return http.Response(
        jsonEncode({
          'data': [
            {
              'ID Nation': '01000US',
              'Nation': 'United States',
              'ID Year': 2023,
              'Year': '2023',
              'Population': 334914895,
              'Slug Nation': 'united-states',
            },
          ],
          'source': [
            {
              'measures': ['Population'],
              'annotations': null,
              'name': 'Test',
            },
          ],
        }),
        200,
      );
    });
    addTearDown(client.close);

    await tester.pumpWidget(MaterialApp(home: DataScreen(client: client)));
    await tester.pumpAndSettle();

    expect(find.text('United States'), findsOneWidget);
    expect(find.text('united-states'), findsOneWidget);
  });
}
