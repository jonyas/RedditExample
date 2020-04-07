import 'package:common/entities.dart';
import 'package:domain/domain.dart';

class LoadSubredditEntryCommentsUseCase {
  const LoadSubredditEntryCommentsUseCase(
    this._subredditRepository,
  );

  final SubredditRepository _subredditRepository;

  Future<List<SubredditEntryComment>> loadSubredditEntryComments(SubredditEntry entry) {
    return _subredditRepository
        .loadSubredditEntryComments(entry)
        .then((iterable) => iterable.toList(growable: false));
  }
}
