import 'dart:async';

import 'package:animations/animations.dart';
import 'package:common/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:presentation/presentation.dart';
import 'package:redditexample/comments_page.dart';
import 'package:redditexample/components.dart';
import 'package:redditexample/extensions.dart';
import 'package:transparent_image/transparent_image.dart';

const double _fabDimension = 48.0;

class SubredditPage extends StatefulWidget {
  @override
  _SubredditPageState createState() => _SubredditPageState();
}

class _SubredditPageState extends State<SubredditPage> {
  Completer _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubredditBloc, SubredditFeedState>(
      builder: (context, state) {
        if (state is SubredditFeedError) {
          return Center(
            child: Text('Failed to fetch entries'),
          );
        }
        if (state is SubredditFeedLoaded) {
          if (state.entries.isEmpty) {
            return Center(
              child: Text('No entries'),
            );
          }
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<SubredditBloc>(context).add(
                RefreshSubredditFeed(),
              );
              return _refreshCompleter.future;
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 48, horizontal: 8),
              itemBuilder: (BuildContext context, int index) {
                return _SubredditEntryWidget(entry: state.entries[index]);
              },
              itemCount: state.entries.length,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      listener: (BuildContext context, SubredditFeedState state) {
        if (state is SubredditFeedLoaded) {
          // Tell indicator we finished loading
          _refreshCompleter?.complete();
          _refreshCompleter = Completer();
        }
      },
    );
  }
}

class _SubredditEntryWidget extends StatelessWidget {
  final SubredditEntry entry;

  const _SubredditEntryWidget({Key key, @required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => showSnackBar(context: context, text: 'This would open Subreddit entry detail page'),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 64, right: 16, bottom: 4, top: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        PostedByWidget(author: entry.author),
                        Expanded(
                          child: PublishedTimeAgoWidget(
                            when: entry.postedAt,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SubredditTypeContainer(type: entry.type),
                  if (entry.image.isNotEmpty)
                    FadeInImage.memoryNetwork(
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image: entry.image.value.toString(),
                    ),
                  if (entry.image.isEmpty)
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      color: Theme.of(context).primaryColor.withOpacity(.1),
                      child: Icon(Icons.image, size: 50, color: Theme.of(context).primaryColor),
                    ),
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.message,
                            size: 18,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(entry.commentCount.toString(), style: Theme.of(context).textTheme.caption),
                        const SizedBox(width: 16),
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
                        const SizedBox(width: 16),
                        CustomIcon(
                          icon: Icons.share,
                          onTap: () => showSnackBar(context: context, text: 'This would open share dialog'),
                        ),
                        const SizedBox(width: 24),
                        CustomIcon(
                          icon: Icons.launch,
                          onTap: () => showSnackBar(context: context, text: 'This would open in external browser'),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: entry.flair.isEmpty ? 0 : 4),
                    child: Text(
                      entry.title,
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (entry.flair.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, bottom: entry.selftext.isEmpty ? 0 : 16),
                      child: FlairWidget(
                        onTap: () => showSnackBar(
                            context: context, text: 'This would open search list with this ${entry.flair.value} flair'),
                        text: entry.flair.value,
                      ),
                    ),
                  if (entry.selftext.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, top: entry.flair.isEmpty ? 16 : 0),
                      child: MarkdownBody(
                        data: entry.selftext,
                        styleSheet: MarkdownStyleSheet(
                          textAlign: WrapAlignment.spaceEvenly,
                          p: Theme.of(context).textTheme.body1,
                        ),
                        onTapLink: (link) => showSnackBar(context: context, text: 'This would open pressed link'),
                      ),
                    ),
                ],
              ),
              Positioned(
                right: 16,
                top: 208,
                child: OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  openBuilder: (BuildContext context, VoidCallback _) {
                    return CommentsPage();
                  },
                  closedElevation: 6.0,
                  closedShape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(_fabDimension / 2),
                    ),
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                  closedColor: Theme.of(context).colorScheme.secondary,
                  closedBuilder: (BuildContext context, VoidCallback openContainer) {
                    return SizedBox(
                      height: _fabDimension,
                      width: _fabDimension,
                      child: Center(
                        child: Icon(
                          Icons.comment,
                          size: 18,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 16,
                child: RedditAuthorAvatar(author: entry.author),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
