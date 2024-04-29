class WinnerInterval {
  final int interval;
  final int previousWin;
  final int followingWin;
  final String producer;

  WinnerInterval({
    required this.interval,
    required this.previousWin,
    required this.followingWin,
    required this.producer,
  });

  factory WinnerInterval.fromJson(Map<String, dynamic> json) {
    return WinnerInterval(
      interval: json['interval'],
      previousWin: json['previousWin'],
      followingWin: json['followingWin'],
      producer: json['producer'],
    );
  }
}

class ProducerInterval {
  final List<WinnerInterval> minWinnerIntervals;
  final List<WinnerInterval> maxWinnerIntervals;

  ProducerInterval(
      {required this.minWinnerIntervals, required this.maxWinnerIntervals});

  factory ProducerInterval.fromJson(Map<String, dynamic> json) {
    return ProducerInterval(
      minWinnerIntervals: List<WinnerInterval>.from(
          json['min'].map((item) => WinnerInterval.fromJson(item))),
      maxWinnerIntervals: List<WinnerInterval>.from(
          json['max'].map((item) => WinnerInterval.fromJson(item))),
    );
  }
}
