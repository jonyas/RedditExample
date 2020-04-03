import 'package:common/entities.dart';
import 'package:flutter/foundation.dart';

abstract class SubredditRemoteDatastore {
  Future<Iterable<SubredditEntry>> loadSubredditEntries({
    @required String subredditName,
    SubredditEntry loadAfterEntry,
  });
}
