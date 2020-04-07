import 'package:common/entities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'package:time/time.dart';

part 'entities.g.dart';

@JsonSerializable(createToJson: false)
class RemoteRedditEntryListing {
  RemoteRedditEntryListing({this.data});

  final RemoteRedditEntryListingData data;

  factory RemoteRedditEntryListing.fromJson(Map<String, dynamic> json) {
    return _$RemoteRedditEntryListingFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteRedditEntryListingData<T extends RemoteRedditListingDataChildren> {
  RemoteRedditEntryListingData({this.children});

  @_RedditEntryConverter()
  final List<T> children;

  factory RemoteRedditEntryListingData.fromJson(Map<String, dynamic> json) {
    return _$RemoteRedditEntryListingDataFromJson(json);
  }
}

class _RedditEntryConverter<T extends RemoteRedditListingDataChildren> implements JsonConverter<T, Object> {
  const _RedditEntryConverter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic> && json.containsKey('kind') && json['kind'] == 't1') {
      return RemoteSubredditCommentListingDataChildren.fromJson(json) as T;
    }
    if (json is Map<String, dynamic> && json.containsKey('kind') && json['kind'] == 't3') {
      return RemoteSubredditListingDataChildren.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}

abstract class RemoteRedditListingDataChildren {}

@JsonSerializable(createToJson: false)
class RemoteSubredditCommentListingDataChildren extends RemoteRedditListingDataChildren {
  RemoteSubredditCommentListingDataChildren({
    this.kind,
    this.data,
  });

  final String kind;
  final RemoteSubredditCommentEntryListingDataChildrenData data;

  factory RemoteSubredditCommentListingDataChildren.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditCommentListingDataChildrenFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditListingDataChildren extends RemoteRedditListingDataChildren {
  RemoteSubredditListingDataChildren({
    this.kind,
    this.data,
  });

  final String kind;
  final RemoteSubredditEntryListingDataChildrenData data;

  factory RemoteSubredditListingDataChildren.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditListingDataChildrenFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteRedditEntryListingDataChildrenData {
  RemoteRedditEntryListingDataChildrenData({
    this.author,
    this.created,
    this.id,
    this.score,
  });

  final String author;
  @JsonKey(name: 'created_utc')
  final num created;
  final String id;
  final int score;

  factory RemoteRedditEntryListingDataChildrenData.fromJson(Map<String, dynamic> json) {
    return _$RemoteRedditEntryListingDataChildrenDataFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildrenData extends RemoteRedditEntryListingDataChildrenData {
  RemoteSubredditEntryListingDataChildrenData({
    String author,
    this.authorThumbnail,
    this.commentCount,
    num created,
    String id,
    this.linkFlairText,
    this.preview,
    this.postHint,
    this.selftext,
    int score,
    this.subreddit,
    this.title,
    this.url,
  }) : super(author: author, created: created, id: id, score: score);

  @JsonKey(name: 'thumbnail')
  final String authorThumbnail;
  @JsonKey(name: 'num_comments')
  final int commentCount;
  @JsonKey(name: 'link_flair_text')
  final String linkFlairText;
  @JsonKey(name: 'post_hint')
  final String postHint;
  final String selftext;
  final String subreddit;
  final String title;
  final String url;
  final RemoteSubredditEntryListingDataChildrenPreview preview;

  factory RemoteSubredditEntryListingDataChildrenData.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenDataFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditCommentEntryListingDataChildrenData extends RemoteRedditEntryListingDataChildrenData {
  RemoteSubredditCommentEntryListingDataChildrenData({
    String author,
    this.body,
    num created,
    String id,
    int score,
  }) : super(author: author, created: created, id: id, score: score);

  final String body;

  factory RemoteSubredditCommentEntryListingDataChildrenData.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditCommentEntryListingDataChildrenDataFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildrenPreview {
  RemoteSubredditEntryListingDataChildrenPreview({this.images});

  final List<RemoteSubredditEntryListingDataChildrenPreviewImage> images;

  factory RemoteSubredditEntryListingDataChildrenPreview.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenPreviewFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildrenPreviewImage {
  RemoteSubredditEntryListingDataChildrenPreviewImage({this.source});

  final RemoteSubredditEntryListingDataChildrenPreviewImageSource source;

  factory RemoteSubredditEntryListingDataChildrenPreviewImage.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenPreviewImageFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildrenPreviewImageSource {
  RemoteSubredditEntryListingDataChildrenPreviewImageSource({this.url});

  final String url;

  factory RemoteSubredditEntryListingDataChildrenPreviewImageSource.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenPreviewImageSourceFromJson(json);
  }
}

extension RemoteSubredditCommentEntryListingDataChildrenDataExtension
    on RemoteSubredditCommentEntryListingDataChildrenData {
  SubredditEntryComment toSubredditEntryComment() {
    return SubredditEntryComment(
      authorUsername: this.author,
      score: this.score,
      text: this.body,
    );
  }
}

extension RemoteSubredditEntryListingDataChildrenDataExtension on RemoteSubredditEntryListingDataChildrenData {
  SubredditEntry toSubredditEntry() {
    return SubredditEntry(
      flair: Optional.fromNullable(this.linkFlairText),
      author: _toRedditAuthor(),
      score: this.score,
      selftext: this.selftext,
      postedAt: DateTime.fromMillisecondsSinceEpoch(this.created.toInt().seconds.inMilliseconds).toLocal(),
      subreddit: this.subreddit,
      url: Uri.parse(this.url),
      title: this.title,
      id: this.id,
      image: preview?.images?.isNotEmpty ?? false
          ? Optional.of(Uri.parse(preview.images.first.source.url.replaceAll('&amp;s', '&s')))
          : const Optional.absent(),
      commentCount: commentCount,
      type: _toSubredditEntryType(),
    );
  }

  SubredditEntryType _toSubredditEntryType() {
    if (this.postHint == null || this.postHint.isEmpty) {
      return SubredditEntryType.DISCUSSION;
    }
    switch (this.postHint) {
      case 'link':
        return SubredditEntryType.LINK;
      case 'image':
        return SubredditEntryType.IMAGE;
      case 'rich:video':
        return SubredditEntryType.VIDEO;
      default:
        return SubredditEntryType.UNKNOWN;
    }
  }

  RedditAuthor _toRedditAuthor() {
    bool _validThumbnail = Uri.parse(this.authorThumbnail).isAbsolute;
    return RedditAuthor(
      name: this.author,
      thumbnail: _validThumbnail ? Optional.of(Uri.parse(this.authorThumbnail)) : const Optional.absent(),
    );
  }
}
