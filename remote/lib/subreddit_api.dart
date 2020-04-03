import 'package:common/entities.dart';
import 'package:data/datasource/subreddit_remote_datastore.dart';
import 'package:remote/entities.dart';
import 'package:remote/subreddit_restclient.dart';

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
