class WinCount {
  final String name;
  final int winCount;

  WinCount({
    required this.name,
    required this.winCount,
  });

  factory WinCount.fromJson(Map<String, dynamic> json) {
    return WinCount(
      name: json['name'],
      winCount: json['winCount'],
    );
  }
}