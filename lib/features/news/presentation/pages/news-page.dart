import 'package:flutter/material.dart';
import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recruitment/features/news/data/models/article.dart';
import 'package:recruitment/features/news/presentation/widgets/article-tile.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          stops: [0.4, 1],
          colors: [
            AppColors.blue,
            Colors.black87,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0x00000000),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.blue,
          leading: IconButton(
              onPressed: (){},
              icon: const FaIcon(FontAwesomeIcons.barsStaggered, color: Colors.white)
          ),
          title: Text(appTitle, style: AppTypography.h1TitleWhite),
          centerTitle: true,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Top Headlines", style: AppTypography.h2TitleBlack),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.80,
                      child: ListView(
                        children: [
                          ArticleTile(),
                          ArticleTile(),
                          ArticleTile(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
