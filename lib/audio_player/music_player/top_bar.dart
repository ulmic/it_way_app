import 'package:it_way_app/audio_player/features/media_player/bloc/media_player_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_route_cubit/playing_route_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_speed_bloc/playing_speed_bloc.dart';
import 'package:it_way_app/audio_player/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_way_app/screen_navigation.dart';
import 'package:it_way_app/statics/navigation.dart';
import 'package:it_way_app/statics/assets.dart';

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
            children: [
              GestureDetector(
                onTap: () {
                  ScreenNavigation.routeTo(
                      route: LibraryRoutes.pop, context: context);
                },
                child: Icon(
                  LibraryAssets.back,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 75.0,
              ),
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
