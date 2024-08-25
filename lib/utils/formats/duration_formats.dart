class DurationFormat {
  static String twoDigits(int n) => n.toString().padLeft(2, '0');

  static String twoDigitsDuration(Duration duration) {
    final format =
        '''${twoDigits(duration.inHours.remainder(60))}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}''';

    return format;
  }
}
