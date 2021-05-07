import 'package:it_way_app/data/podcast_data.dart';

class PodcastStates {
  const PodcastStates._(
      {this.status = PodcastStatus.dataLoading, this.podcats});

  const PodcastStates.dataLoaded(List<PodcastData> podcats)
      : this._(
          status: PodcastStatus.dataLoaded,
          podcats: podcats,
        );

  const PodcastStates.failure() : this._(status: PodcastStatus.failure);

  const PodcastStates.dataLoading() : this._(status: PodcastStatus.dataLoading);

  final PodcastStatus status;
  final List<PodcastData> podcats;
}

enum PodcastStatus { dataLoaded, failure, dataLoading }
