class WinnerInterval {
  final int interval;
  final int previusWin;
  final int followingWin;
  final String producer;

  WinnerInterval({
    required this.interval,
    required this.previusWin,
    required this.followingWin,
    required this.producer,
  });

  factory WinnerInterval.fromJson(Map<String, dynamic> json) {
    return WinnerInterval(
      interval: json['interval'],
      previusWin: json['previusWin'],
      followingWin: json['followingWin'],
      producer: json['producer'],
    );
  }
}