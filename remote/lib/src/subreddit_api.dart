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
        .then((entryListingDataChildren) => entryListingDataChildren.map((item) => item.data.toSubredditEntry()));
  }
}
