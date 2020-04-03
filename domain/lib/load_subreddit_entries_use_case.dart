import 'package:domain/repositories/subreddit_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:common/entities.dart';

class LoadSubredditEntriesUseCase {
  const LoadSubredditEntriesUseCase(
    this._subredditRepository,
  );

  final SubredditRepository _subredditRepository;

  Future<List<SubredditEntry>> loadSubredditEntries({
    @required String subredditName,
    SubredditEntry loadAfterEntry,
  }) {
    return _subredditRepository
        .loadSubredditEntries(subredditName: subredditName, loadAfterEntry: loadAfterEntry)
        .then((iterable) => iterable.toList(growable: false));
  }
}
