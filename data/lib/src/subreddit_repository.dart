import 'package:common/entities.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

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
