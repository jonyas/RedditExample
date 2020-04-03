import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:remote/remote.dart';

typedef ObjectFactory<T> = T Function(Injector i);

class DependencyInjection {
  static void setup() async {
    // Remote layer binding
    bind<SubredditRestClient>((i) => SubredditRestClient(Dio()));
    bind<SubredditRemoteDatastore>((i) => SubredditApi(i.get()));
    // Data layer binding
    bind<SubredditRepository>((i) => SubredditRepositoryImpl(i.get()));
    // Domain layer binding
    bind<LoadSubredditEntriesUseCase>((i) => LoadSubredditEntriesUseCase(i.get()));
  }

  static void bind<T>(ObjectFactory<T> factoryFn, {bool isSingleton = false, String key}) {
    Injector.getInjector().map<T>((i) => factoryFn(i), isSingleton: isSingleton, key: key);
  }

  static void disposeInjection() {
    Injector.getInjector().dispose();
  }

  static T get<T>({String key, Map<String, dynamic> additionalParameters}) {
    return Injector.getInjector().get<T>(key: key, additionalParameters: additionalParameters);
  }
}
