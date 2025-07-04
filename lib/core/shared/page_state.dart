import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
sealed class PageState with _$PageState {
  const factory PageState.init() = PageInit;

  const factory PageState.loading() = PageLoading;

  const factory PageState.success() = PageSuccess;

  const factory PageState.failure(String message) = PageFailure;
}
