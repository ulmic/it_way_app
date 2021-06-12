import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/blocs/video/video_cubit.dart';
import 'package:it_way_app/blocs/video/video_state.dart';
import 'package:it_way_app/components/loading.dart';
import 'package:it_way_app/components/video_card.dart';
import 'package:it_way_app/data/video_data.dart';
import 'package:it_way_app/components/appBar.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoCubit videoScreenCubit = VideoCubit();
  @override
  void initState() {
    videoScreenCubit.getVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(typeOfContent: 'Видео'),
      body: SafeArea(
        child: BlocBuilder<VideoCubit, VideoStates>(
          bloc: videoScreenCubit,
          builder: (BuildContext context, VideoStates state) {
            if (state.status == VideoStatus.dataLoading) {
              return LoadingApp();
            }
            if (state.status == VideoStatus.dataLoaded) {
              final List<VideoData> listVideoData = state.video;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: buildVideo(listVideoData),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  List<VideoCard> buildVideo(List<VideoData> listVideoData) {
    List<VideoCard> listVideo = [];
    for (final videoData in listVideoData) {
      listVideo.add(
        VideoCard(
          data: videoData,
        ),
      );
    }
    return listVideo;
  }
}
