import 'package:flutter/material.dart';
import 'package:it_way_app/blocs/podcast/podcast_cubit.dart';
import 'package:it_way_app/blocs/podcast/podcast_state.dart';
import 'package:it_way_app/components/podcast_card.dart';
import 'package:it_way_app/components/appBar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/data/podcast_data.dart';

class PodcastScreen extends StatefulWidget {
  @override
  _PodcastScreen createState() => _PodcastScreen();
}

class _PodcastScreen extends State<PodcastScreen> {
  PodcastCubit podcastScreenCubit = PodcastCubit();

  @override
  void initState() {
    podcastScreenCubit.getPodcasts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Подкасты'),
      body: SafeArea(
        child: BlocBuilder<PodcastCubit, PodcastStates>(
          cubit: podcastScreenCubit,
          builder: (BuildContext context, PodcastStates state) {
            if (state.status == PodcastStatus.dataLoading) {}
            if (state.status == PodcastStatus.failure) {}
            if (state.status == PodcastStatus.dataLoaded) {
              final List<PodcastData> listPodcatData = state.podcats;
              return SingleChildScrollView(
                child: Column(
                  children: buildPodcasts(listPodcatData),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  List<PodcastCard> buildPodcasts(List<PodcastData> listPodcatData) {
    List<PodcastCard> listPodcasts = [];
    for (final podcastData in listPodcatData) {
      listPodcasts.add(
        PodcastCard(
          podcastTitle: podcastData.podcastTitle,
          podcastNumber: podcastData.podcastNumber.toString(),
          podcastImage: podcastData.podcastImageURL,
          playingTimeOfPodcast: podcastData.playingTimeOfPodcast,
          publishedAt: podcastData.publishedAt,
        ),
      );
    }
    return listPodcasts;
  }
}
