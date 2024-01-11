import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:recruitment/core/constants/constants.dart';
import 'package:recruitment/core/resources/colors.dart';
import 'package:recruitment/core/resources/typography.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recruitment/features/login/presentation/pages/login_page.dart';
import 'package:recruitment/features/news/domain/repositories/articles_repository.dart';
import 'package:recruitment/features/news/presentation/bloc/news_bloc.dart';
import 'package:recruitment/features/news/presentation/bloc/news_event.dart';
import 'package:recruitment/features/news/presentation/widgets/article-tile.dart';
import 'package:recruitment/features/news/presentation/widgets/button.dart';
import 'package:recruitment/features/news/presentation/widgets/drawer.dart';
import 'package:recruitment/features/news/presentation/widgets/navigation-bar.dart';

import '../../../../core/get_it/get_it.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../bloc/news_state.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //  _fetchNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = BlocProvider.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoggedInState) {
          newsBloc.add(FetchNewsEvent());
        }
        if (state is LoggedOutState || state is LogoutSuccessState) {
          context.go("/login");
        }
      },
      builder: (context, state) {
        final LoginBloc loginBloc = BlocProvider.of(context);
        if (state is LoginInitial || state is LoggedOutState) {
          return const Scaffold(
            body: SizedBox(height: 0),
          );
        }
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
              toolbarHeight: 80,
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
                  icon: const FaIcon(FontAwesomeIcons.doorOpen, color: Colors.white),
                  onPressed: () {
                    loginBloc.add(
                        LogoutRequestEvent()
                    );
                    context.go("/login");
                  },
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
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
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
                    margin: const EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Headlines:',
                            style: AppTypography.h2TitleBlack,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.67,
                          child: BlocBuilder<NewsBloc, NewsState>(
                            bloc: newsBloc,
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
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.circleExclamation),
                                      const Text("There was an error loading the news"),
                                      AppButton(
                                        text: "Retry",
                                        onPress: (){
                                          newsBloc.add(
                                              FetchNewsEvent()
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox();
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
      },
    );
  }
}
