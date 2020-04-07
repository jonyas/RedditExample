import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/entities.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:presentation/src/comments_event.dart';
import 'package:presentation/src/comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({
    @required this.loadSubredditEntriesUseCase,
    @required this.subredditEntry,
  });

  final LoadSubredditEntryCommentsUseCase loadSubredditEntriesUseCase;
  final SubredditEntry subredditEntry;

  @override
  get initialState => const CommentsUninitialized();

  @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is LoadComments) {
      try {
        final comments = await loadSubredditEntriesUseCase.loadSubredditEntryComments(subredditEntry);
        yield CommentsLoaded(entries: comments);
      } catch (e) {
        debugPrint(e.toString());
        // We could provide catch error to state so UI can render it
        yield const CommentsError();
      }
    }
  }
}
