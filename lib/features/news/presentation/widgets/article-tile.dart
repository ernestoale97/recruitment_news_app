import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:recruitment/features/news/domain/entities/article_entity.dart';

import '../../../../core/resources/utils.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const ArticleTile({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go("/details", extra: article);
      },
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 278,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.97, color: Color(0X51221F1F)),
                borderRadius: BorderRadius.circular(17.93),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 14.55,
                  top: 14.54,
                  child: CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      imageBuilder: (context, imageProvider) => ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          height: MediaQuery.of(context).size.height * 0.2,
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
                          width: MediaQuery.of(context).size.width * 0.82,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const CupertinoActivityIndicator(radius: 11),
                        ),
                      ),
                      errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.08),
                          ),
                          child: const Icon(Icons.error),
                        ),
                      )
                  ),
                ),
                Positioned(
                  left: 14.50,
                  top: 196,
                  child: SizedBox(
                    width: 303,
                    child: Text(
                      article.title!,
                      style: TextStyle(
                        color: Color(0xFF222222),
                        fontSize: 20,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.90,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 28,
                  top: 155,
                  child: SizedBox(
                    width: 112,
                    child: Text(
                      Utils.convertToAgo(article.publishedAt!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.bold,
                        height: 0,
                        letterSpacing: -0.48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
