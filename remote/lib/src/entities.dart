import 'package:common/entities.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'package:time/time.dart';

part 'entities.g.dart';

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListing {
  RemoteSubredditEntryListing({this.data});

  final RemoteSubredditEntryListingData data;

  factory RemoteSubredditEntryListing.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingData {
  RemoteSubredditEntryListingData({this.children});

  final List<RemoteSubredditEntryListingDataChildren> children;

  factory RemoteSubredditEntryListingData.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildren {
  RemoteSubredditEntryListingDataChildren({this.data});

  final RemoteSubredditEntryListingDataChildrenData data;

  factory RemoteSubredditEntryListingDataChildren.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class RemoteSubredditEntryListingDataChildrenData {
  RemoteSubredditEntryListingDataChildrenData({
    this.author,
    this.authorThumbnail,
    this.commentCount,
    this.created,
    this.id,
    this.linkFlairText,
    this.preview,
    this.postHint,
    this.selftext,
    this.score,
    this.subreddit,
    this.title,
    this.url,
  });

  final String author;
  @JsonKey(name: 'thumbnail')
  final String authorThumbnail;
  @JsonKey(name: 'created_utc')
  final num created;
  @JsonKey(name: 'num_comments')
  final int commentCount;
  final String id;
  @JsonKey(name: 'link_flair_text')
  final String linkFlairText;
  @JsonKey(name: 'post_hint')
  final String postHint;
  final String selftext;
  final String subreddit;
  final int score;
  final String title;
  final String url;
  final RemoteSubredditEntryListingDataChildrenPreview preview;

  factory RemoteSubredditEntryListingDataChildrenData.fromJson(Map<String, dynamic> json) {
    return _$RemoteSubredditEntryListingDataChildrenDataFromJson(json);
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
