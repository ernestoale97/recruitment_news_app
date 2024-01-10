import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:recruitment/features/news/domain/entities/article_entity.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/resources/utils.dart';

class NewsDetailsPage extends StatefulWidget {
  final ArticleEntity article;
  const NewsDetailsPage({required this.article, super.key});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blue,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
            onPressed: (){
              context.pop();
            },
          );
        }),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.newspaper),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.article.source?.name ?? "",
                          style: AppTypography.headerSmall,
                        ),
                        Text(
                          Utils.convertToAgo(widget.article.publishedAt),
                          style: const TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 0,
                            letterSpacing: -0.48,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 18),
                CachedNetworkImage(
                    imageUrl: widget.article.urlToImage!,
                    imageBuilder: (context, imageProvider) => ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: screenWidth,
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: screenWidth,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                        ),
                        child: const CupertinoActivityIndicator(radius: 11),
                      ),
                    ),
                    errorWidget: (context, url, error) => ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        width: screenWidth,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.08),
                        ),
                        child: const Icon(Icons.error),
                      ),
                    )
                ),
                const SizedBox(height: 18),
                Text(
                  widget.article.source?.name ?? "",
                  style: TextStyle(
                    color: Color(0xFFDE4519),
                    fontSize: 12,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.54,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.article.title ?? "",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 25,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -1.12,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.article.content ?? "",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Text(
                  "See full article in:",
                  style: const TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.bold,
                    height: 0,
                    letterSpacing: -0.48,
                  ),
                ),
                Text(
                    widget.article.url ?? "",
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.48,
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
