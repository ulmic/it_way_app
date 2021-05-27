import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';

class AudioTrackModel extends AudioTrack {
  AudioTrackModel(
    String url,
    String description,
    String imageUrl,
    String title,
  ) : super(
          url,
          description,
          imageUrl,
          title,
        );
}
