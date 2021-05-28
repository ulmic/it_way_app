import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/audio_player/error_bar.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';
import 'package:it_way_app/audio_player/features/show_error/error_bar_cubit.dart';
import 'package:it_way_app/audio_player/music_player/music_player.dart';
import 'package:it_way_app/data/podcast_data.dart';
import 'package:it_way_app/statics/style.dart';
import 'package:it_way_app/components/appBarBack.dart';
import 'package:it_way_app/audio_player/injection_container.dart' as di;

import 'package:it_way_app/audio_player/injection_container.dart';

import 'package:it_way_app/audio_player/theme_factory.dart';

import 'package:flutter/services.dart';

class OnePodcastScreen extends StatefulWidget {
  const OnePodcastScreen({
    @required this.data,
  });
  final PodcastData data;

  @override
  _OnePodcastScreenState createState() => _OnePodcastScreenState();
}

class _OnePodcastScreenState extends State<OnePodcastScreen> {
  String get podcastImage => widget.data.podcastImageURL;
  String get podcastTitle => widget.data.podcastTitle;
  static const _errorBarHeight = 80.0;
  AudioTrack audioTrack;

  @override
  void initState() {
    audioTrack = AudioTrack(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', //widget.data.audioFile,
      widget.data.publishedAt, // тут должно быть описание
      widget.data.podcastImageURL,
      widget.data.podcastTitle,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

    return AudioServiceWidget(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: serviceLocator<ErrorBarCubit>())
          ],
          child: BlocListener<ErrorBarCubit, ErrorBarStateAbstract>(
              listener: (context, state) {
            if (state is ShowErrorBarState) {
              Timer(Duration(seconds: 5), () {
                serviceLocator<ErrorBarCubit>().hide();
              });
            }
          }, child: BlocBuilder<ErrorBarCubit, ErrorBarStateAbstract>(
                  builder: (context, state) {
            final message = state is ShowErrorBarState ? state.message : '';
            final position =
                state is ShowErrorBarState ? 0.0 : _errorBarHeight * -1;
            return Stack(
              children: [
                MusicPlayer(
                  track: audioTrack,
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  width: MediaQuery.of(context).size.width,
                  curve: Curves.easeInOutQuart,
                  top: position,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 1;
                      if (details.delta.dy < -sensitivity) {
                        serviceLocator<ErrorBarCubit>().hide();
                      }
                    },
                    child: ErrorBar(_errorBarHeight, message),
                  ),
                ),
              ],
            );
          })),
        ),
      ),
    );
  }
}
