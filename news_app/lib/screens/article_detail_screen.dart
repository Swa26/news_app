import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String urlToImage;
  final String? publishedAt;

  const ArticleDetailScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.urlToImage,
    this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsApp'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              urlToImage.isNotEmpty
                  ? AspectRatio(
                      aspectRatio: isPortrait ? 16 / 9 : 3 / 2,
                      child: Image.network(
                        urlToImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            'https://etimg.etb2bimg.com/photo/99755772.cms',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  : Image.network(
                      'https://etimg.etb2bimg.com/photo/99755772.cms',
                      fit: BoxFit.cover,
                    ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Published at: ${publishedAt ?? 'Unknown Date'}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
