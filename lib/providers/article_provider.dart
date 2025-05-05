import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycloudindo_test_app/models/news_article.dart';

final newsListProvider =
    StateNotifierProvider<NewsListNotifier, List<NewsArticle>>(
      (ref) => NewsListNotifier(),
    );

final latestNewsProvider = Provider<List<NewsArticle>>((ref) {
  final allNews = ref.watch(newsListProvider);
  return List.from(allNews)..sort((a, b) {
    if (a.publishedAt == null || b.publishedAt == null) return 0;
    return b.publishedAt!.compareTo(a.publishedAt!);
  });
});

final newsDetailProvider = Provider.family<NewsArticle?, String>((ref, id) {
  final allNews = ref.watch(newsListProvider);
  return allNews.firstWhere(
    (article) => article.id == id,
    orElse: () => NewsArticle.empty(),
  );
});

class NewsListNotifier extends StateNotifier<List<NewsArticle>> {
  NewsListNotifier() : super([]);
}
