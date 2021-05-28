import 'package:it_way_app/audio_player/features/audio_track/domain/entities/audio_track.dart';

class AudioTrackModel extends AudioTrack {
  AudioTrackModel(
    String url,
    String number,
    String imageUrl,
    String title,
  ) : super(
          url,
          number,
          imageUrl,
          title,
        );
}
