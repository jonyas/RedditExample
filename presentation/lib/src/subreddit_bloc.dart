import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:presentation/src/subreddit_event.dart';
import 'package:presentation/src/subreddit_state.dart';

class SubredditBloc extends Bloc<SubredditFeedEvent, SubredditFeedState> {
  SubredditBloc({
    @required this.loadSubredditEntriesUseCase,
    @required this.subredditName,
  });

  final LoadSubredditEntriesUseCase loadSubredditEntriesUseCase;
  final String subredditName;

  @override
  get initialState => const SubredditFeedUninitialized();

  @override
  Stream<SubredditFeedState> mapEventToState(SubredditFeedEvent event) async* {
    if (event is LoadSubredditFeed) {
      yield* _mapLoadFeedToState();
    }
    if (event is RefreshSubredditFeed) {
      yield* _mapRefreshFeedToState();
    }
  }

  Stream<SubredditFeedState> _mapLoadFeedToState() async* {
    try {
      final entries = await loadSubredditEntriesUseCase.loadSubredditEntries(subredditName: subredditName);
      yield SubredditFeedLoaded(entries: entries);
    } catch (_) {
      // We could provide catch error to state so UI can render it
      yield const SubredditFeedError();
    }
  }

  Stream<SubredditFeedState> _mapRefreshFeedToState() async* {
    try {
      final entries = await loadSubredditEntriesUseCase.loadSubredditEntries(subredditName: subredditName);
      yield SubredditFeedLoaded(entries: entries);
    } catch (_) {
      // Ignore error, show previous loaded state
      yield state;
    }
  }
}
