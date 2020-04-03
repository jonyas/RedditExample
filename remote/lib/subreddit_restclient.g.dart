// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subreddit_restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SubredditRestClient implements SubredditRestClient {
  _SubredditRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://www.reddit.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  loadSubredditEntries(subredditName, {afterSubredditId}) async {
    ArgumentError.checkNotNull(subredditName, 'subredditName');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'after': afterSubredditId};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/r/$subredditName.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RemoteSubredditEntryListing.fromJson(_result.data);
    return Future.value(value);
  }
}
