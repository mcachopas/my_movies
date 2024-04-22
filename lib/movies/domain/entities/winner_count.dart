class WinnerCount {
  final int winnerCount;
  final int year;

  WinnerCount({
    required this.winnerCount,
    required this.year,
  });

  factory WinnerCount.fromJson(Map<String, dynamic> json) {
    return WinnerCount(
      winnerCount: json['winnerCount'],
      year: json['year'],
    );
  }
}