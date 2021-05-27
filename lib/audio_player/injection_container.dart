import 'package:it_way_app/audio_player/features/audio_track/data/repositories/aurio_track_repository.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/repositories/audio_track_repository_abstract.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/usecases/get_audio_track_usecase.dart';
import 'package:it_way_app/audio_player/features/media_player/bloc/media_player_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_duration_cubit/playing_duration_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_position_cudit/playing_position_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_route_cubit/playing_route_cubit.dart';
import 'package:it_way_app/audio_player/features/media_player/playing_speed_bloc/playing_speed_bloc.dart';
import 'package:it_way_app/audio_player/features/media_player/plyer_seek_cubit/player_seek_cubit.dart';
import 'package:it_way_app/audio_player/features/show_error/error_bar_cubit.dart';
import 'package:it_way_app/audio_player/theme_factory.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

init() async {
  serviceLocator.registerLazySingleton<PlayingRouteCubit>(
    () => PlayingRouteCubit(),
  );
  serviceLocator.registerLazySingleton<PlayingSpeedBloc>(
    () => PlayingSpeedBloc(),
  );
  serviceLocator.registerLazySingleton<PlayingDurationCubit>(
    () => PlayingDurationCubit(),
  );
  serviceLocator.registerLazySingleton<PlayingPositionCubit>(
    () => PlayingPositionCubit(),
  );
  serviceLocator.registerLazySingleton<PlayerSeekCubit>(
    () => PlayerSeekCubit(),
  );
  serviceLocator.registerLazySingleton<MediaPlayerCubit>(
    () => MediaPlayerCubit(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<GetAudioTrackUseCase>(
    () => GetAudioTrackUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AudioTrackRepository>(
    () => AudioTrackRepository(),
  );
  serviceLocator.registerLazySingleton<ThemeFactory>(
    () => ThemeFactory(Brightness.dark),
  );
  serviceLocator.registerLazySingleton<ErrorBarCubit>(
    () => ErrorBarCubit(),
  );
}
