class MovieFilter {
  int page;
  int size;
  bool? winner;

  MovieFilter({
    required this.page,
    required this.size,
    this.winner,
  });
}