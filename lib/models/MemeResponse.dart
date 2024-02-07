class Meme {
  Meme({
    required this.postlink,
    required this.subreddit,
    required this.title,
    required this.url,
    required this.author,
    required this.ups,
    required this.nsfw,
    required this.spoiler,
    required this.preview,
  });

  String postlink;
  String subreddit;
  String title;
  String url;
  String author;
  int ups;
  bool nsfw;
  bool spoiler;
  List<String> preview;

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
      postlink: json["postLink"],
      subreddit: json["subreddit"],
      title: json["title"],
      url: json["url"],
      nsfw: json["nsfw"],
      author: json["author"],
      ups: json["ups"],
      spoiler: json["spoiler"],
      preview: List<String>.from(json["preview"]));
}
