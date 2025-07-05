// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageState<T> {


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageState<T>);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PageState<$T>()';
  }


}

/// @nodoc
class $PageStateCopyWith<T, $Res> {
  $PageStateCopyWith(PageState<T> _, $Res Function(PageState<T>) __);
}


/// @nodoc


class PageInit<T> implements PageState<T> {
  const PageInit();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageInit<T>);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PageState<$T>.init()';
  }


}


/// @nodoc


class PageLoading<T> implements PageState<T> {
  const PageLoading();


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageLoading<T>);
  }


  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PageState<$T>.loading()';
  }


}


/// @nodoc


class PageSuccess<T> implements PageState<T> {
  const PageSuccess([this.data]);


  final T? data;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageSuccessCopyWith<T, PageSuccess<T>> get copyWith =>
      _$PageSuccessCopyWithImpl<T, PageSuccess<T>>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }


  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'PageState<$T>.success(data: $data)';
  }


}

/// @nodoc
abstract mixin class $PageSuccessCopyWith<T, $Res>
    implements $PageStateCopyWith<T, $Res> {
  factory $PageSuccessCopyWith(PageSuccess<T> value,
      $Res Function(PageSuccess<T>) _then) = _$PageSuccessCopyWithImpl;

  @useResult
  $Res call({
    T? data
  });


}

/// @nodoc
class _$PageSuccessCopyWithImpl<T, $Res>
    implements $PageSuccessCopyWith<T, $Res> {
  _$PageSuccessCopyWithImpl(this._self, this._then);

  final PageSuccess<T> _self;
  final $Res Function(PageSuccess<T>) _then;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
    return _then(PageSuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
      as T?,
    ));
  }


}

/// @nodoc


class PageFailure<T> implements PageState<T> {
  const PageFailure(this.message);


  final String message;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageFailureCopyWith<T, PageFailure<T>> get copyWith =>
      _$PageFailureCopyWithImpl<T, PageFailure<T>>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PageFailure<T> &&
            (identical(other.message, message) || other.message == message));
  }


  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'PageState<$T>.failure(message: $message)';
  }


}

/// @nodoc
abstract mixin class $PageFailureCopyWith<T, $Res>
    implements $PageStateCopyWith<T, $Res> {
  factory $PageFailureCopyWith(PageFailure<T> value,
      $Res Function(PageFailure<T>) _then) = _$PageFailureCopyWithImpl;

  @useResult
  $Res call({
    String message
  });


}

/// @nodoc
class _$PageFailureCopyWithImpl<T, $Res>
    implements $PageFailureCopyWith<T, $Res> {
  _$PageFailureCopyWithImpl(this._self, this._then);

  final PageFailure<T> _self;
  final $Res Function(PageFailure<T>) _then;

  /// Create a copy of PageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
    return _then(PageFailure<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
      as String,
    ));
  }


}

// dart format on
