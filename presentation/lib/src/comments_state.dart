import 'package:common/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsUninitialized extends CommentsState {
  const CommentsUninitialized();
}

class CommentsError extends CommentsState {
  const CommentsError();
}

class CommentsLoaded extends CommentsState {
  final List<SubredditEntryComment> entries;

  const CommentsLoaded({
    @required this.entries,
  });

  @override
  List<Object> get props => [entries];

  @override
  String toString() => 'CommentsLoaded { entries: ${entries.length}}';
}
