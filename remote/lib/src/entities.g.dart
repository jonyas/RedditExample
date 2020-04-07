// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRedditEntryListing _$RemoteRedditEntryListingFromJson(
    Map<String, dynamic> json) {
  return RemoteRedditEntryListing(
    data: json['data'] == null
        ? null
        : RemoteRedditEntryListingData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

RemoteRedditEntryListingData<T> _$RemoteRedditEntryListingDataFromJson<
    T extends RemoteRedditListingDataChildren>(Map<String, dynamic> json) {
  return RemoteRedditEntryListingData<T>(
    children: (json['children'] as List)
        ?.map(_RedditEntryConverter<T>().fromJson)
        ?.toList(),
  );
}

RemoteSubredditCommentListingDataChildren
    _$RemoteSubredditCommentListingDataChildrenFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditCommentListingDataChildren(
    kind: json['kind'] as String,
    data: json['data'] == null
        ? null
        : RemoteSubredditCommentEntryListingDataChildrenData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

RemoteSubredditListingDataChildren _$RemoteSubredditListingDataChildrenFromJson(
    Map<String, dynamic> json) {
  return RemoteSubredditListingDataChildren(
    kind: json['kind'] as String,
    data: json['data'] == null
        ? null
        : RemoteSubredditEntryListingDataChildrenData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

RemoteRedditEntryListingDataChildrenData
    _$RemoteRedditEntryListingDataChildrenDataFromJson(
        Map<String, dynamic> json) {
  return RemoteRedditEntryListingDataChildrenData(
    author: json['author'] as String,
    created: json['created_utc'] as num,
    id: json['id'] as String,
    score: json['score'] as int,
  );
}

RemoteSubredditEntryListingDataChildrenData
    _$RemoteSubredditEntryListingDataChildrenDataFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditEntryListingDataChildrenData(
    author: json['author'] as String,
    authorThumbnail: json['thumbnail'] as String,
    commentCount: json['num_comments'] as int,
    created: json['created_utc'] as num,
    id: json['id'] as String,
    linkFlairText: json['link_flair_text'] as String,
    preview: json['preview'] == null
        ? null
        : RemoteSubredditEntryListingDataChildrenPreview.fromJson(
            json['preview'] as Map<String, dynamic>),
    postHint: json['post_hint'] as String,
    selftext: json['selftext'] as String,
    score: json['score'] as int,
    subreddit: json['subreddit'] as String,
    title: json['title'] as String,
    url: json['url'] as String,
  );
}

RemoteSubredditCommentEntryListingDataChildrenData
    _$RemoteSubredditCommentEntryListingDataChildrenDataFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditCommentEntryListingDataChildrenData(
    author: json['author'] as String,
    body: json['body'] as String,
    created: json['created_utc'] as num,
    id: json['id'] as String,
    score: json['score'] as int,
  );
}

RemoteSubredditEntryListingDataChildrenPreview
    _$RemoteSubredditEntryListingDataChildrenPreviewFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditEntryListingDataChildrenPreview(
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : RemoteSubredditEntryListingDataChildrenPreviewImage.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RemoteSubredditEntryListingDataChildrenPreviewImage
    _$RemoteSubredditEntryListingDataChildrenPreviewImageFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditEntryListingDataChildrenPreviewImage(
    source: json['source'] == null
        ? null
        : RemoteSubredditEntryListingDataChildrenPreviewImageSource.fromJson(
            json['source'] as Map<String, dynamic>),
  );
}

RemoteSubredditEntryListingDataChildrenPreviewImageSource
    _$RemoteSubredditEntryListingDataChildrenPreviewImageSourceFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditEntryListingDataChildrenPreviewImageSource(
    url: json['url'] as String,
  );
}
