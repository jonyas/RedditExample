import 'package:equatable/equatable.dart';

abstract class SubredditFeedEvent extends Equatable {
  const SubredditFeedEvent();

  @override
  List<Object> get props => [];
}

class LoadSubredditFeed extends SubredditFeedEvent {
  const LoadSubredditFeed();
}

class RefreshSubredditFeed extends SubredditFeedEvent {
  const RefreshSubredditFeed();
}
