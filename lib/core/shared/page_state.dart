import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
sealed class PageState<T> with _$PageState<T> {
  const factory PageState.init() = PageInit;

  const factory PageState.loading() = PageLoading;

  const factory PageState.success([T? data]) = PageSuccess<T>;

  const factory PageState.failure(String message) = PageFailure;
}
