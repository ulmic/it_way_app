import 'package:it_way_app/data/video_data.dart';

class VideoStates {
  const VideoStates._({this.status = VideoStatus.dataLoading, this.video});

  const VideoStates.dataLoaded(List<VideoData> videoList)
      : this._(
          status: VideoStatus.dataLoaded,
          video: videoList,
        );

  const VideoStates.failure() : this._(status: VideoStatus.failure);

  const VideoStates.dataLoading() : this._(status: VideoStatus.dataLoading);

  final VideoStatus status;
  final List<VideoData> video;
}

enum VideoStatus { dataLoaded, failure, dataLoading }
