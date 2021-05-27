import 'package:it_way_app/audio_player/features/audio_track/data/repositories/aurio_track_repository.dart';
import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';
import 'package:it_way_app/audio_player//features/audio_track/domain/repositories/audio_track_repository_abstract.dart';

class GetAudioTrackUseCase {
  final AudioTrackRepository repository;

  GetAudioTrackUseCase(this.repository);

  Future<AudioTrack> next({AudioTrack track}) {
    return repository.next(track: track);
  }
}
