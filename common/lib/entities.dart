import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

enum SubredditEntryType { DISCUSSION, IMAGE, VIDEO, LINK, UNKNOWN }

@immutable
class SubredditEntry extends Equatable {
  const SubredditEntry({
    @required this.author,
    @required this.commentCount,
    @required this.id,
    @required this.image,
    @required this.flair,
    @required this.postedAt,
    @required this.score,
    @required this.selftext,
    @required this.subreddit,
    @required this.title,
    @required this.type,
    @required this.url,
  });

  final RedditAuthor author;
  final int commentCount;
  final String id;
  final Optional<Uri> image;
  final Optional<String> flair;
  final DateTime postedAt;
  final int score;
  final String selftext;
  final String subreddit;
  final String title;
  final SubredditEntryType type;
  final Uri url;

  @override
  List<Object> get props =>
      [author, commentCount, id, image, flair, postedAt, score, selftext, subreddit, title, type, url];
}

@immutable
class RedditAuthor extends Equatable {
  const RedditAuthor({
    @required this.name,
    @required this.thumbnail,
  });

  final String name;
  final Optional<Uri> thumbnail;

  @override
  List<Object> get props => [name, thumbnail];
}
