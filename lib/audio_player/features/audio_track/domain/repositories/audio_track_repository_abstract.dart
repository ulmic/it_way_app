import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';

abstract class AudioTrackRepositoryAbstract {
  Future<AudioTrack> next({AudioTrack track});
}
