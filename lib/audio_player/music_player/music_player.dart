import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';
import 'package:it_way_app/audio_player/features/media_player/bloc/media_player_cubit.dart';
import 'package:it_way_app/audio_player/injection_container.dart';
import 'package:it_way_app/audio_player/music_player/bottom_bar.dart';
import 'package:it_way_app/audio_player/music_player/progress_bar.dart';
import 'package:it_way_app/audio_player/music_player/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/statics/colors.dart';
import 'package:it_way_app/statics/style.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({this.track});

  final AudioTrack track;
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool started = false;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator<MediaPlayerCubit>()),
      ],
      child: BlocBuilder<MediaPlayerCubit, MediaPlayerStateAbstract>(
          builder: (context, mediaPlayerState) {
        if (!started) {
          BlocProvider.of<MediaPlayerCubit>(context).play(track);
          started = true;
        }

        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: mediaQuery.padding.top + 8, left: 10, right: 10),
                child: TopBar(),
              ),
              Divider(thickness: 0.5, color: LibraryColors.kUnActiveColor),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Эпизод ${mediaPlayerState.audioTrack?.number ?? ''} ',
                            style: LibraryStyle.onePodcastHeading,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Stack(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: mediaPlayerState.audioTrack?.imageUrl != null
                              ? Image.network(
                                  mediaPlayerState.audioTrack?.imageUrl)
                              : Image.asset('assets/images/podcast.jpg'),
                        ),
                        (() {
                          /// styling ProgressIndicator
                          if (mediaPlayerState
                              is MediaPlayerLoadingTrackState) {
                            return SizedBox(
                              width: 200,
                              height: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  CircularProgressIndicator(),
                                ],
                              ),
                            );
                          }

                          return SizedBox();
                        }()),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            mediaPlayerState.audioTrack?.title ?? '',
                            textAlign: TextAlign.center,
                            style: LibraryStyle.onePodcastHeading,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'IT Way',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: LibraryColors.kUnActiveColor),
                          ),
                        ),
                      ],
                    ),
                    ProgressBar(),
                  ]),
                ),
              ),
              BottomBar(track),
            ],
          ),
        );
      }),
    );
  }
}
