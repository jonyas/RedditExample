import 'package:common/entities.dart';
import 'package:dio/dio.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:quiver/core.dart';
import 'package:remote/remote.dart';
import 'package:test/test.dart';

import 'remote_test_data.dart';

void main() {
  MockWebServer _server;
  SubredditRestClient _client;
  group('SubredditRestClient', () {
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
      _server.enqueue(body: emptySubreddit, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntries('name');
      // verify
      expect(entries.data.children, isEmpty);
    });

    test("fetches and parses list with single entry", () async {
      // prepare
      _server.enqueue(body: singleEntrySubreddit, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _client.loadSubredditEntries('name');
      // verify
      expect(entries.data.children, isNotEmpty);
      expect(entries.data.children.first.data.author, 'UT_Teapot');
      expect(entries.data.children.first.data.authorThumbnail, 'self');
      expect(entries.data.children.first.data.created, 1584559119);
      expect(entries.data.children.first.data.commentCount, 9);
      expect(entries.data.children.first.data.id, 'fkvbje');
      expect(entries.data.children.first.data.linkFlairText, isNull);
      expect(entries.data.children.first.data.postHint, isNull);
      expect(
        entries.data.children.first.data.selftext,
        "I hope everybody's doing well. If you're working from home and can, please make sure you walk around outside (but maintain a social distance of 6 feet minimum.) \n\nOne glimmer of good news we can take from this situation is that we will see a reduction in carbon emissions. Nowhere near as many people are driving to work now, or flying. Same can probably be said for people on cruises as well. Even if this only goes on for a few months, this is still a much needed reduction in CO2. Of course when quarantines are lifted trips that were cancelled will resume, however by the end of this year there will still be a noticeable drop in overall emissions.",
      );
      expect(entries.data.children.first.data.score, 42);
      expect(entries.data.children.first.data.subreddit, 'ClimateActionPlan');
      expect(entries.data.children.first.data.title, 'One bit of good news to take from the COVID-19 outbreak.');
      expect(entries.data.children.first.data.url,
          'https://www.reddit.com/r/ClimateActionPlan/comments/fkvbje/one_bit_of_good_news_to_take_from_the_covid19/');
    });
  });

  group('SubredditApi', () {
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
      _server.enqueue(body: emptySubreddit, headers: {"Content-Type": "application/json"});
      // execute
      final entries = await _api.loadSubredditEntries(subredditName: 'name');
      // verify
      expect(entries, isEmpty);
    });

    test("fetches subreddit with content", () async {
      // prepare
      _server.enqueue(body: singleEntrySubreddit, headers: {"Content-Type": "application/json"});
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
}
