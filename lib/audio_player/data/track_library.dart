class TrackLibrary {
  static final playList = {
    0: Track(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      'First Author',
      'Title 1',
    ),
    1: Track(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      'Second Author',
      'Title 2',
    ),
    2: Track(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      'Third Author',
      'Title 3',
    ),
  };
}

class Track {
  final String url;
  final String author;
  final String title;

  Track(this.url, this.author, this.title);
}
