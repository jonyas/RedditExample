import 'package:common/entities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:redditexample/entities.dart';
import 'package:redditexample/extensions.dart';

class PostedByWidget extends StatelessWidget {
  PostedByWidget({
    this.author,
    this.authorUsername,
    Key key,
  })  : assert((author != null) != (authorUsername != null && authorUsername.isNotEmpty),
            'Only author or authorUsername required. Not both, or none.'),
        super(key: key);

  final RedditAuthor author;
  final String authorUsername;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.caption,
        children: [
          TextSpan(text: 'Posted by '),
          TextSpan(
            text: author?.name ?? authorUsername,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(fontStyle: FontStyle.italic, backgroundColor: Colors.grey, color: Colors.white),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showSnackBar(context: context, text: 'This would open ${author?.name ?? authorUsername} profile page');
              },
          )
        ],
      ),
    );
  }
}

class PublishedTimeAgoWidget extends StatelessWidget {
  const PublishedTimeAgoWidget({
    @required this.when,
    this.textAlign = TextAlign.start,
    Key key,
  }) : super(key: key);

  final DateTime when;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      _toTimeAgoText(when),
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.caption,
    );
  }

  String _toTimeAgoText(DateTime when) {
    final inTimeTuple = when.toTimeAgoRange();
    switch (inTimeTuple.item1) {
      case TimeAgoRange.MOMENTS:
        return 'Moments ago';
      case TimeAgoRange.MINUTES:
        return '${inTimeTuple.item2} minutes ago';
      case TimeAgoRange.HOURS:
        return '${inTimeTuple.item2} hours ago';
      case TimeAgoRange.WEEKS:
        return '${inTimeTuple.item2} weeks ago';
      case TimeAgoRange.DAYS:
        return '${inTimeTuple.item2} days ago';
      case TimeAgoRange.MONTHS:
        return '${inTimeTuple.item2} months ago';
      case TimeAgoRange.YEARS:
        return '${inTimeTuple.item2} years ago';
      default:
        throw StateError('${inTimeTuple.item1} not a recognised time range');
    }
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    @required this.onTap,
    @required this.icon,
    Key key,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 18,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}

class RedditAuthorAvatar extends StatelessWidget {
  const RedditAuthorAvatar({@required this.author});

  final RedditAuthor author;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: author.thumbnail.isPresent
          ? CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(author.thumbnail.value.toString()),
              backgroundColor: Theme.of(context).accentColor.withOpacity(.1),
            )
          : CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).accentColor,
              child: Text(
                author.name.substring(0, 2).toUpperCase(),
                style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
              ),
            ),
      onTap: () {
        showSnackBar(context: context, text: 'This would open ${author.name} profile page');
      },
    );
  }
}

class FlairWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const FlairWidget({
    @required this.onTap,
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text('#$text', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

class SubredditTypeContainer extends StatelessWidget {
  const SubredditTypeContainer({
    @required this.type,
    Key key,
  }) : super(key: key);

  final SubredditEntryType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Text(
        _toTypeText(type).toUpperCase(),
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
      ),
    );
  }

  String _toTypeText(SubredditEntryType type) {
    switch (type) {
      case SubredditEntryType.DISCUSSION:
        return 'Discussion';
      case SubredditEntryType.IMAGE:
        return 'Image';
      case SubredditEntryType.VIDEO:
        return 'Video';
      case SubredditEntryType.LINK:
        return 'Link';
      case SubredditEntryType.UNKNOWN:
        return '';
      default:
        throw ArgumentError('$type is not a valid SubredditEntryType');
    }
  }
}

class CustomMarkdownBody extends StatelessWidget {
  const CustomMarkdownBody({
    @required this.text,
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.spaceEvenly,
        p: Theme.of(context).textTheme.body1,
      ),
      onTapLink: (link) => showSnackBar(context: context, text: 'This would open pressed link'),
    );
  }
}
