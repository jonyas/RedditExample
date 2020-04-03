import 'package:common/entities.dart';
import 'package:data/datasource/subreddit_remote_datastore.dart';
import 'package:flutter/foundation.dart';
import 'package:domain/repositories/subreddit_repository.dart';

class SubredditRepositoryImpl implements SubredditRepository {
  const SubredditRepositoryImpl(this._remoteDatastore);

  final SubredditRemoteDatastore _remoteDatastore;

  @override
  Future<Iterable<SubredditEntry>> loadSubredditEntries({
    @required String subredditName,
    SubredditEntry loadAfterEntry,
  }) {
    // If we would have cache layer, this method would be responsible of deciding which
    // source to use, combine, etc. based on requirements
    return _remoteDatastore.loadSubredditEntries(subredditName: subredditName, loadAfterEntry: loadAfterEntry);
  }
}
