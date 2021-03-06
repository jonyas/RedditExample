import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';

import 'entities.dart';

part 'subreddit_restclient.g.dart';

@RestApi(baseUrl: "https://www.reddit.com/")
abstract class SubredditRestClient {
  factory SubredditRestClient(Dio dio, {String baseUrl}) = _SubredditRestClient;

  @GET("/r/{subredditName}.json")
  Future<RemoteRedditEntryListing> loadSubredditEntries(
    @Path('subredditName') String subredditName, {
    @Query("after") String afterSubredditId,
  });

  @GET("/r/{subredditName}/comments/{subredditEntryId}.json")
  Future<List<RemoteRedditEntryListing>> loadSubredditEntryComments({
    @required @Path('subredditName') String subredditName,
    @required @Path('subredditEntryId') String subredditEntryId,
    @Query('threaded') bool threaded,
  });
}
