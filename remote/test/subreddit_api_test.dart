import 'package:common/entities.dart';
import 'package:dio/dio.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:quiver/core.dart';
import 'package:remote/remote.dart';
import 'package:remote/src/entities.dart';
import 'package:test/test.dart';

import 'remote_test_data.dart';

void main() {
  group('SubredditRestClient loadSubredditEntries', () {
    MockWebServer _server;
    SubredditRestClient _client;

    setUp(() async {
      _server = MockWebServer();
      await _server.start();
      _client = SubredditRestClient(
        Dio()..interceptors.add(LogInterceptor(responseBody: true)),
        baseUrl: _server.url,
      );
    });

    tearDown(() {
      _server.shutdown();
    });

    test("fetches and parses empty entry list", () async {
      // prepare
      _server.enqueue(body: emptySubredditResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntries('name');
      // verify
      expect(entries.data.children, isEmpty);
    });

    test("fetches and parses list with single entry", () async {
      // prepare
      _server.enqueue(body: singleEntrySubredditResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntries('name');
      // verify
      final RemoteSubredditListingDataChildren subredditEntries = entries.data.children.first;
      expect(subredditEntries.data.author, 'UT_Teapot');
      expect(subredditEntries.data.authorThumbnail, 'self');
      expect(subredditEntries.data.created, 1584559119);
      expect(subredditEntries.data.commentCount, 9);
      expect(subredditEntries.data.id, 'fkvbje');
      expect(subredditEntries.data.linkFlairText, isNull);
      expect(subredditEntries.data.postHint, isNull);
      expect(
        subredditEntries.data.selftext,
        "I hope everybody's doing well. If you're working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) \n\nOne glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.",
      );
      expect(subredditEntries.data.score, 42);
      expect(subredditEntries.data.subreddit, 'ClimateActionPlan');
      expect(subredditEntries.data.title, 'One bit of good news to take from the COVID-19 outbreak.');
      expect(subredditEntries.data.url,
          'https://www.reddit.com/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/');
    });
  });

  group('SubredditRestClient loadSubredditEntryComments', () {
    MockWebServer _server;
    SubredditRestClient _client;

    setUp(() async {
      _server = MockWebServer();
      await _server.start();
      _client = SubredditRestClient(
        Dio()..interceptors.add(LogInterceptor(responseBody: true)),
        baseUrl: _server.url,
      );
    });

    tearDown(() {
      _server.shutdown();
    });

    test("fetches and parses empty entry list", () async {
      // prepare
      _server.enqueue(body: emptySubredditCommentsResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntryComments(subredditName: 'name', subredditEntryId: 'id');
      // verify content where comments are is empty
      expect(entries.last.data.children, isEmpty);
    });

    test("fetches and parses list with single comments entry", () async {
      // prepare
      _server.enqueue(body: singleSubredditCommentsResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntryComments(subredditName: 'name', subredditEntryId: 'id');
      // verify
      expect(entries.last.data.children, isNotEmpty);
      final RemoteSubredditCommentListingDataChildren commentsEntries = entries.last.data.children.first;
      expect(commentsEntries.data.author, 'BiLemons');
      expect(commentsEntries.data.created, 1585498628);
      expect(commentsEntries.data.id, 'fluadn3');
      expect(commentsEntries.data.score, 6);
      expect(commentsEntries.data.body,
          'I hope everyone stays safe with corona going around. I love seeing all these good news here and it legitimately makes me happy. WE can do this!');
    });
  });

  group('SubredditApi loadSubredditEntries', () {
    MockWebServer _server;
    SubredditRestClient _client;
    SubredditApi _api;
    setUp(() async {
      _server = MockWebServer();
      await _server.start();
      _client = SubredditRestClient(
        Dio()..interceptors.add(LogInterceptor(responseBody: true)),
        baseUrl: _server.url,
      );
      _api = SubredditApi(_client);
    });

    tearDown(() {
      _server.shutdown();
    });

    test("fetches an empty subreddit", () async {
      // prepare
      _server.enqueue(body: emptySubredditResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _api.loadSubredditEntries(subredditName: 'name');
      // verify
      expect(entries, isEmpty);
    });

    test("fetches subreddit with content", () async {
      // prepare
      _server.enqueue(body: singleEntrySubredditResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _api.loadSubredditEntries(subredditName: 'name');
      // verify
      expect(entries, isNotEmpty);
      final subredditEntry = entries.first;
      expect(subredditEntry.author.name, 'UT_Teapot');
      expect(subredditEntry.author.thumbnail, const Optional.absent());
      expect(subredditEntry.commentCount, 9);
      expect(subredditEntry.postedAt.isBefore(DateTime.now()), isTrue);
      expect(subredditEntry.id, 'fkvbje');
      expect(subredditEntry.flair, const Optional.absent());
      expect(subredditEntry.type, SubredditEntryType.DISCUSSION);
      expect(
        subredditEntry.selftext,
        "I hope everybody's doing well. If you're working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) \n\nOne glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.",
      );
      expect(subredditEntry.score, 42);
      expect(subredditEntry.subreddit, 'ClimateActionPlan');
      expect(subredditEntry.title, 'One bit of good news to take from the COVID-19 outbreak.');
      expect(
        subredditEntry.url,
        Uri.parse(
            'https://www.reddit.com/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/'),
      );
    });
  });

  group('SubredditApi loadSubredditEntryComments', () {
    final entry = SubredditEntry(
      score: 0,
      selftext: 'text',
      author: RedditAuthor(
        thumbnail: Optional.absent(),
        name: 'name',
      ),
      image: Optional.absent(),
      flair: Optional.absent(),
      commentCount: 0,
      postedAt: DateTime.now(),
      url: Uri.parse('https://reddit.com'),
      id: 'id',
      title: 'title',
      type: SubredditEntryType.DISCUSSION,
      subreddit: 'subreddit',
    );

    MockWebServer _server;
    SubredditRestClient _client;
    SubredditApi _api;
    setUp(() async {
      _server = MockWebServer();
      await _server.start();
      _client = SubredditRestClient(
        Dio()..interceptors.add(LogInterceptor(responseBody: true)),
        baseUrl: _server.url,
      );
      _api = SubredditApi(_client);
    });

    tearDown(() {
      _server.shutdown();
    });

    test("fetches a subreddit with empty comments", () async {
      // prepare
      _server.enqueue(body: emptySubredditCommentsResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _api.loadSubredditEntryComments(entry);
      // verify
      expect(entries, isEmpty);
    });

    test("fetches subreddit comments with content", () async {
      // prepare
      _server.enqueue(body: singleSubredditCommentsResponse, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _api.loadSubredditEntryComments(entry);
      // verify
      expect(entries, isNotEmpty);
      final comment = entries.first;
      expect(comment.authorUsername, 'BiLemons');
      expect(comment.score, 6);
      expect(
        comment.text,
        'I hope everyone stays safe with corona going around. I love seeing all these good news here and it legitimately makes me happy. WE can do this!',
      );
    });
  });
}
