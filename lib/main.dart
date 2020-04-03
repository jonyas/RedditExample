import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';
import 'package:redditexample/subreddit_page.dart';

const String _SUBREDDIT_TOPIC = 'ClimateActionPlan';

void main() {
  DependencyInjection.setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subreddit example',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        accentColor: Colors.lightGreen[900],
        scaffoldBackgroundColor: Colors.grey[200],
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 14, letterSpacing: -0.03),
          body2: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: -0.23),
          caption: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1),
          title: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.33, height: 1.2),
        ),
      ),
      home: Scaffold(
        body: BlocProvider(
          create: (context) {
            return SubredditBloc(
              loadSubredditEntriesUseCase: DependencyInjection.get(),
              subredditName: _SUBREDDIT_TOPIC,
            )..add(const LoadSubredditFeed());
          },
          child: SubredditPage(),
        ),
      ),
    );
  }
}
