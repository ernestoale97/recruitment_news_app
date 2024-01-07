import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recruitment/features/news/data/models/article.dart';
import 'package:recruitment/features/news/domain/repositories/articles-repository.dart';
import 'package:recruitment/features/news/presentation/bloc/news-bloc.dart';
import 'package:recruitment/features/news/presentation/bloc/news-event.dart';
import 'package:recruitment/features/news/presentation/widgets/article-tile.dart';
import 'package:recruitment/features/news/presentation/widgets/drawer.dart';
import 'package:recruitment/features/news/presentation/widgets/navigation-bar.dart';

import '../../../../core/getit/getit.dart';
import '../bloc/news-state.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsBloc _bloc = NewsBloc(sl<ArticleRepository>());

  @override
  void initState() {
    _bloc.add(
      FetchNewsEvent(),
    );
    super.initState();
  }
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
        drawer: const AppDrawer(),
        bottomNavigationBar: const AppNavigationBar(),
        backgroundColor: const Color(0x00000000),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.blue,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const FaIcon(FontAwesomeIcons.barsStaggered, color: Colors.white),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          title: Text(appTitle, style: AppTypography.h1TitleWhite),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.userCheck, color: Colors.white),
              onPressed: () {  },
            )
          ],
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
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Headlines:',
                        style: AppTypography.h2TitleBlack,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: BlocConsumer<NewsBloc, NewsState>(
                        bloc: _bloc,
                        listener: (context, state) {

                        },
                        builder: (context, state) {
                          if (state is FetchingNewsState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is FetchedNewsState) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: state.news.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                              itemBuilder: (_, index) {
                                return ArticleTile(
                                  article: state.news[index],
                                );
                              },
                            );
                          }
                          if (state is FetchFailNewsState) {
                            return Text("error");
                          }
                          return SizedBox();
                        },
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
