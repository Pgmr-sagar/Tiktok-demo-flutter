import 'package:get_it/get_it.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/cubit/feed_cubit.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/repository/feed_repository.dart';
import 'package:tiktok_demo/feed_with_stateful_cubit/data/service/feed_service.dart';
import 'package:tiktok_demo/network/api_service.dart';

T get<T extends Object>() => GetIt.I.get<T>();

void setupDI() {
  GetIt.I.registerFactory<ApiService>(() => ApiService());
  GetIt.I.registerFactory<FeedService>(() => FeedService(get()));
  GetIt.I.registerFactory<FeedRepository>(() => FeedRepository(get()));
  GetIt.I.registerFactory<FeedCubit>(() => FeedCubit(get()));
}
