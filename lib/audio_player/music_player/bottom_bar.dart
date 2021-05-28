import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';
import 'package:it_way_app/audio_player/features/media_player/bloc/media_player_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_position_cudit/playing_position_cubit.dart';
import 'package:it_way_app/audio_player/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/statics/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar(this.track);

  final AudioTrack track;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator<MediaPlayerCubit>()),
        BlocProvider.value(value: serviceLocator<PlayingPositionCubit>()),
      ],
      child: BlocBuilder<MediaPlayerCubit, MediaPlayerStateAbstract>(
          builder: (context, mediaPlayerState) {
        var _playCallback = () async {
          print('play tap');

          BlocProvider.of<MediaPlayerCubit>(context).play(track);
        };

        var _resumeCallback = () async {
          print('resume tap');

          BlocProvider.of<MediaPlayerCubit>(context).resume();
        };

        var _pauseCallback = () {
          BlocProvider.of<MediaPlayerCubit>(context).pause();
          print('pause tap');
        };

        return BlocBuilder<PlayingPositionCubit, PlayingPositionStateAbstract>(
            builder: (context, playingPositionState) {
          final _playingPosition = playingPositionState is PlayingPositionState
              ? playingPositionState.position
              : Duration(seconds: 0);
          return Padding(
            padding: EdgeInsets.only(bottom: mediaQuery.padding.bottom),
            child: Column(children: [
              Divider(thickness: 0.5, color: LibraryColors.kUnActiveColor),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                        onPressed: () {
                          Duration newPosition =
                              _playingPosition - Duration(seconds: 30);
                          BlocProvider.of<MediaPlayerCubit>(context)
                              .seek(newPosition);
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(40, 40)),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Icon(
                          Icons.replay_30,
                          color: Colors.black,
                          size: 30.0,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        onPressed: mediaPlayerState is MediaPlayerPlayingState
                            ? _pauseCallback
                            : mediaPlayerState is MediaPlayerInitialState ||
                                    mediaPlayerState is MediaPlayerStoppedState
                                ? _playCallback
                                : _resumeCallback,
                        child: mediaPlayerState is MediaPlayerPlayingState
                            ? Icon(
                                Icons.pause,
                                color: Colors.white,
                                size: 30,
                              )
                            : Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 30,
                              ),
                        backgroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Duration newPosition =
                              _playingPosition + Duration(seconds: 30);
                          BlocProvider.of<MediaPlayerCubit>(context)
                              .seek(newPosition);
                        },
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(40, 40)),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        child: Icon(
                          Icons.forward_30,
                          color: Colors.black,
                          size: 30.0,
                        )),
                  ],
                ),
              )
            ]),
          );
        });
      }),
    );
  }
}
