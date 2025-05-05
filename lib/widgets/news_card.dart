import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mycloudindo_test_app/constants/constants.dart';
import 'package:mycloudindo_test_app/pages/detail_page.dart';

import '../models/news_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(article.publishedAt.toString());
    String formattedDate = DateFormat('EEEE, d MMMM y').format(dateTime);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: ColorsApp.colorBg,
              blurRadius: 10,
              offset: Offset(-3, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    article.urlToImage == null
                        ? ''
                        : article.urlToImage.toString(),
                errorWidget: (context, string, _) {
                  return const Icon(Icons.error);
                },
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                    ),
                  ),
                  Text(
                    article.title.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    article.description.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
