import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/features/news/domain/entities/article-entity.dart';

import '../../../../core/resources/colors.dart';
import '../../../../core/resources/typography.dart';

class NewsDetailsPage extends StatefulWidget {
  ArticleEntity article;
  NewsDetailsPage({required this.article, super.key});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Back to", style: TextStyle(fontSize: 12),),
            Text("HOME",  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 163,
                  height: 41,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 51,
                        top: 5,
                        child: SizedBox(
                          width: 112,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'CNN Phil',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 15,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: -0.68,
                                  ),
                                ),
                                TextSpan(
                                  text: 'i',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 15,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'ppines',
                                  style: TextStyle(
                                    color: Color(0xFF222222),
                                    fontSize: 15,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                    letterSpacing: -0.68,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51,
                        top: 22,
                        child: SizedBox(
                          width: 112,
                          child: Text(
                            '10 minutes ago',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 12,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.48,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 41,
                          height: 41,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 41,
                                  height: 41,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, -1.00),
                                      end: Alignment(0, 1),
                                      colors: [Color(0xFFDE4519), Color(0xFFFFA58B)],
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.41,
                                top: 7.07,
                                child: Text(
                                  'cnn',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21.96,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w800,
                                    height: 0,
                                    letterSpacing: -2.09,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: 343,
                  height: 216,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/343x216"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.75),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: 340,
                  height: 955,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 21,
                        child: SizedBox(
                          width: 340,
                          child: Text(
                            widget.article.title ?? "",
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 25,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -1.12,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 340,
                          child: Text(
                            'GENERAL NEWS',
                            style: TextStyle(
                              color: Color(0xFFDE4519),
                              fontSize: 12,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.54,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 114,
                        child: SizedBox(
                          width: 340,
                          child: Text(
                            widget.article.content ?? "",
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 15,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ),
                    ],
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

