import 'package:equatable/equatable.dart';
import 'package:common/entities.dart';
import 'package:flutter/foundation.dart';

abstract class SubredditFeedState extends Equatable {
  const SubredditFeedState();

  @override
  List<Object> get props => [];
}

class SubredditFeedUninitialized extends SubredditFeedState {
  const SubredditFeedUninitialized();
}

class SubredditFeedError extends SubredditFeedState {
  const SubredditFeedError();
}

class SubredditFeedLoaded extends SubredditFeedState {
  final List<SubredditEntry> entries;

  const SubredditFeedLoaded({
    @required this.entries,
  });

  @override
  List<Object> get props => [entries];

  @override
  String toString() => 'SubredditFeedLoaded { entries: ${entries.length}}';
}
