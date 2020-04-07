import 'package:common/entities.dart';
import 'package:data/data.dart';
import 'package:remote/remote.dart';

import 'entities.dart';

class SubredditApi implements SubredditRemoteDatastore {
  const SubredditApi(this._restClient);

  final SubredditRestClient _restClient;

  @override
  Future<Iterable<SubredditEntry>> loadSubredditEntries({String subredditName, SubredditEntry loadAfterEntry}) {
    return _restClient
        .loadSubredditEntries(subredditName, afterSubredditId: loadAfterEntry?.id)
        .then((entryListing) => entryListing.data.children)
        .then(
          (entryListingDataChildren) => entryListingDataChildren
              .cast<RemoteSubredditListingDataChildren>()
              .map((item) => item.data.toSubredditEntry()),
        );
  }

  @override
  Future<Iterable<SubredditEntryComment>> loadSubredditEntryComments(SubredditEntry entry) {
    return _restClient
        // For simplicity, let's leave it all comments as single threaded
        .loadSubredditEntryComments(subredditName: entry.subreddit, subredditEntryId: entry.id, threaded: false)
        .then((entryListing) => entryListing.last.data.children)
        .then(
          (entryListingDataChildren) => entryListingDataChildren
              .cast<RemoteSubredditCommentListingDataChildren>()
              .map((item) => item.data.toSubredditEntryComment()),
        );
  }
}
