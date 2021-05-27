import 'package:it_way_app/audio_player/data/track_library.dart';
import 'package:it_way_app/audio_player/features/audio_track/data/model/audio_track_model.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/repositories/audio_track_repository_abstract.dart';

class AudioTrackRepository extends AudioTrackRepositoryAbstract {
  @override
  Future<AudioTrack> next({AudioTrack track}) async {
    return track;
  }
}
