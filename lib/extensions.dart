import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time/time.dart';
import 'package:redditexample/entities.dart';
import 'package:tuple/tuple.dart';

extension ContextExtension on Widget {
  void showSnackBar({
    @required BuildContext context,
    @required String text,
  }) {
    final scaffold = Scaffold.of(context);
    if (scaffold != null) {
      scaffold.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}

extension DateTimeExtension on DateTime {
  Tuple2<TimeAgoRange, int> toTimeAgoRange() {
    final timeDifference = DateTime.now().difference(this);
    if (1.minutes.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.MOMENTS, 0);
    }
    if (1.hours.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.MINUTES, timeDifference.inMinutes);
    }
    if (1.days.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.HOURS, timeDifference.inHours);
    }
    if (7.days.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.DAYS, timeDifference.inDays);
    }
    if (5.weeks.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.WEEKS, timeDifference.inWeeks);
    }
    if (365.days.ago.isBefore(this)) {
      return Tuple2(TimeAgoRange.MONTHS, (timeDifference.inWeeks / 52).round());
    }
    return Tuple2(TimeAgoRange.YEARS, (timeDifference.inDays / 365).round());
  }
}
