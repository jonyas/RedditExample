import 'package:common/entities.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:redditexample/components.dart';
import 'package:redditexample/extensions.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({
    @required this.subredditEntry,
    Key key,
  }) : super(key: key);

  final SubredditEntry subredditEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${subredditEntry.title} comments')),
      body: BlocProvider(
        create: (context) {
          return CommentsBloc(
            loadSubredditEntriesUseCase: DependencyInjection.get(),
            subredditEntry: subredditEntry,
          )..add(const LoadComments());
        },
        child: _CommentsPageContent(),
      ),
    );
  }
}

class _CommentsPageContent extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<_CommentsPageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is CommentsError) {
          return Center(
            child: Text('Failed to fetch comments'),
          );
        }
        if (state is CommentsLoaded) {
          if (state.entries.isEmpty) {
            return Center(
              child: Text('No comments'),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              return _CommentEntryWidget(entry: state.entries[index]);
            },
            itemCount: state.entries.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _CommentEntryWidget extends StatelessWidget {
  const _CommentEntryWidget({
    @required this.entry,
    Key key,
  }) : super(key: key);

  final SubredditEntryComment entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PostedByWidget(authorUsername: entry.authorUsername),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIcon(
                        icon: Icons.keyboard_arrow_down,
                        onTap: () => showSnackBar(context: context, text: 'This would decrease score'),
                      ),
                      const SizedBox(width: 4),
                      Text(entry.score.toString(), style: Theme.of(context).textTheme.caption),
                      const SizedBox(width: 4),
                      CustomIcon(
                        icon: Icons.keyboard_arrow_up,
                        onTap: () => showSnackBar(context: context, text: 'This would raise score'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomMarkdownBody(text: entry.text),
          ],
        ),
      ),
    );
  }
}
