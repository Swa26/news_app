import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/screens/article_detail_screen.dart';

void main() {
  testWidgets('ArticleDetailScreen displays the correct title and content', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArticleDetailScreen(
          title: 'Test Title',
          content: 'Test Content',
          urlToImage: 'https://example.com/image.jpg',
          publishedAt: '2024-08-13T16:05:37.000Z',
        ),
      ),
    );

    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Content'), findsOneWidget);
    expect(find.text('Published at: 2024-08-13T16:05:37.000Z'), findsOneWidget);
  });
}
