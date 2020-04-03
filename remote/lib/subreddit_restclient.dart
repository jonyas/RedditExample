import 'package:dio/dio.dart';
import 'package:remote/entities.dart';
import 'package:retrofit/http.dart';

part 'subreddit_restclient.g.dart';

@RestApi(baseUrl: "https://www.reddit.com/")
abstract class SubredditRestClient {
  factory SubredditRestClient(Dio dio, {String baseUrl}) = _SubredditRestClient;

  @GET("/r/{subredditName}.json")
  Future<RemoteSubredditEntryListing> loadSubredditEntries(
    @Path('subredditName') String subredditName, {
    @Query("after") String afterSubredditId,
  });
}
