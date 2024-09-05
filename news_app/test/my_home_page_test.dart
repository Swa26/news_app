import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/models/news_article.dart';
import 'package:provider/provider.dart';
import 'package:news_app/screens/home_page.dart';
import 'package:news_app/store/news_store.dart';
import 'package:mockito/mockito.dart';

class MockNewsState extends Mock implements NewsState {}

void main() {
  testWidgets('MyHomePage displays a loading indicator while fetching', (WidgetTester tester) async {
    final mockNewsState = MockNewsState();

    when(mockNewsState.isLoading).thenReturn(true);

    await tester.pumpWidget(
      ChangeNotifierProvider<NewsState>.value(
        value: mockNewsState,
        child: MaterialApp(home: MyHomePage(title: 'NewsApp')),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('MyHomePage displays articles after loading', (WidgetTester tester) async {
    final mockNewsState = MockNewsState();
    final articles = [
      const MyModelForAPI(
        title: 'Crypto Bro Charters Private SpaceX Mission to Earth’s Poles',
        url: 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=cce1f18f0a4c47c0a276b4cb1793d2be',
        description: 'Fram2 could fly as early as this year, marking SpaceXs seventh private crew of astronauts.',
        // Set other fields as needed
      ),
      const MyModelForAPI(
        title: 'Proton Drive now has a tier for business users',
        url: 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=cce1f18f0a4c47c0a276b4cb1793d2be',
        description: '"Proton Drive from Swiss technology company Proton AG now has a Professional tier. It joins services like Proton Mail, Proton VPN, and Proton Pass to receive professional tiers, letting teams select a single individual product that they need rather than signin…',
        // Set other fields as needed
      ),
    ];

    when(mockNewsState.isLoading).thenReturn(false);
    when(mockNewsState.newsArticles).thenReturn(articles);

    await tester.pumpWidget(
      ChangeNotifierProvider<NewsState>.value(
        value: mockNewsState,
        child: const MaterialApp(home: MyHomePage(title: 'NewsApp')),
      ),
    );

    // Verify that the articles are displayed
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Crypto Bro Charters Private SpaceX Mission to Earth’s Poles'), findsOneWidget);
    expect(find.text('Proton Drive now has a tier for business users'), findsOneWidget);
    // Add additional checks based on your UI
  });
}
