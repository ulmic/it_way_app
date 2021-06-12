import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/blocs/news/news_cubit.dart';
import 'package:it_way_app/blocs/news/news_state.dart';
import 'package:it_way_app/components/loading.dart';
import 'package:it_way_app/data/news_data.dart';

import '../components/news_card.dart';

import 'package:it_way_app/components/appBar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsCubit newsScreenCubit = NewsCubit();

  @override
  void initState() {
    newsScreenCubit.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Новости'),
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsStates>(
          bloc: newsScreenCubit,
          builder: (BuildContext context, NewsStates state) {
            if (state.status == NewsStatus.dataLoading) {
              return LoadingApp();
            }
            if (state.status == NewsStatus.dataLoaded) {
              final List<NewsData> listNewsData = state.news;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: buildNews(listNewsData),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

List<NewsCard> buildNews(List<NewsData> listNewsData) {
  List<NewsCard> listNews = [];
  for (final newsData in listNewsData) {
    listNews.add(
      NewsCard(
        data: newsData,
      ),
    );
  }
  return listNews;
}
