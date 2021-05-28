import 'package:it_way_app/audio_player/features/media_player/bloc/media_player_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_route_cubit/playing_route_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_speed_bloc/playing_speed_bloc.dart';
import 'package:it_way_app/audio_player/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator<PlayingSpeedBloc>()),
        BlocProvider.value(value: serviceLocator<PlayingRouteCubit>()),
      ],
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PlayingSpeedBloc, PlayingSpeedStateAbstract>(
                  builder: (context, playingSpeedState) {
                return SizedBox(
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<MediaPlayerCubit>(context)
                          .increaseSpeed();
                    },
                    child: Text(
                      playingSpeedState.speed.toString() + 'x',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
