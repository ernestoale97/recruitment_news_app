import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitment/core/constants/constants.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 348,
          height: 278,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.97, color: Color(0xFFEF0909)),
              borderRadius: BorderRadius.circular(17.93),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 14.55,
                top: 14.54,
                child: Container(
                  width: 319,
                  height: 167,
                  decoration: ShapeDecoration(
                    color: Color(0x51221F1F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.75),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14.50,
                top: 196,
                child: SizedBox(
                  width: 303,
                  child: Text(
                    'Philippines military conducts successful operations against Islamist extremist groups',
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
                left: 27.50,
                top: 30,
                child: Container(
                  width: 149.50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 37.50,
                        top: 7,
                        child: SizedBox(
                          width: 112,
                          child: Text(
                            'Rappler',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w800,
                              height: 0,
                              letterSpacing: -0.63,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 29,
                          height: 29,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 29,
                                  height: 29,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF24E1E),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 4,
                                top: 6,
                                child: Text(
                                  'rpl',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.53,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w900,
                                    height: 0,
                                    letterSpacing: -0.62,
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
              ),
              Positioned(
                left: 285,
                top: 32,
                child: Container(
                  width: 32,
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
              ),
              Positioned(
                left: 28,
                top: 155,
                child: SizedBox(
                  width: 112,
                  child: Text(
                    '2 hours ago',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
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
    );
  }
}

