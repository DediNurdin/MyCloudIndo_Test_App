import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/news_model.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai, Mulai Eksplorasi Kamu 🚀',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                    ),
                  ),
                  Text(
                    'Masuk ke aplikasi untuk mulai eksplorasi bersama kami sekarang',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            isLoading
                ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(child: CircularProgressIndicator()),
                )
                : Expanded(
                  child: ListView.builder(
                    itemCount: news.articles!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(article: news.articles![index]);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
