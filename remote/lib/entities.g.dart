// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSubredditEntryListing _$RemoteSubredditEntryListingFromJson(
    Map<String, dynamic> json) {
  return RemoteSubredditEntryListing(
    data: json['data'] == null
        ? null
        : RemoteSubredditEntryListingData.fromJson(
            json['data'] as Map<String, dynamic>),
  );
}

RemoteSubredditEntryListingData _$RemoteSubredditEntryListingDataFromJson(
    Map<String, dynamic> json) {
  return RemoteSubredditEntryListingData(
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : RemoteSubredditEntryListingDataChildren.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

RemoteSubredditEntryListingDataChildren
    _$RemoteSubredditEntryListingDataChildrenFromJson(
        Map<String, dynamic> json) {
  return RemoteSubredditEntryListingDataChildren(
    data: json['data'] == null
        ? null
        : RemoteSubredditEntryListingDataChildrenData.fromJson(
            json['data'] as Map<String, dynamic>),
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
