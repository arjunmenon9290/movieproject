class moviedetails {
  String title;
  String year;
  String type;
  String imgurl;
  final String imdbID;

  moviedetails(
      {required this.imgurl,
      required this.title,
      required this.type,
      required this.year,
      required this.imdbID});

  factory moviedetails.fromJson(Map<String, dynamic> json) => moviedetails(
      imgurl: json['Poster'],
      title: json['Title'],
      type: json['Type'],
      year: json['Year'],
      imdbID: json['imdbID']);
}
