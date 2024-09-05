// Base URL for the News API
import 'package:flutter/material.dart';

const String BASE_API_URL = 'https://newsapi.org/v2/';

// API endpoint for fetching news articles
const String NEWS_ENDPOINT = 'everything?q=bitcoin&apiKey=cce1f18f0a4c47c0a276b4cb1793d2be';

// Full API URL
const String FULL_API_URL = '$BASE_API_URL$NEWS_ENDPOINT';

const String IMAGE_URL='https://etimg.etb2bimg.com/photo/99755772.cms';

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String urlToImage;
  final bool isPortrait;
  final String publishedAt;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.isPortrait, required this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ensure the Column doesn't take more space than needed
        children: [
          if (urlToImage.isNotEmpty)
            AspectRatio(
              aspectRatio: isPortrait ? 16 / 9 : 3 / 2,
              child: Image.network(
                urlToImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://etimg.etb2bimg.com/photo/99755772.cms',
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          else
            Image.network(
              'https://etimg.etb2bimg.com/photo/99755772.cms',
              fit: BoxFit.cover,
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Use Text widget directly, avoid using Expanded or Flexible
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/articleDetail',
                          arguments: {
                            'title': title,
                            'content': description,
                            'urlToImage': urlToImage,
                            'publishedAt': publishedAt,
                          },
                        );
                      },
                      child: const Text('Read more'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
