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
mixin _$PageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState()';
}


}

/// @nodoc
class $PageStateCopyWith<$Res>  {
$PageStateCopyWith(PageState _, $Res Function(PageState) __);
}


/// @nodoc


class PageInit implements PageState {
  const PageInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.init()';
}


}




/// @nodoc


class PageLoading implements PageState {
  const PageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.loading()';
}


}




/// @nodoc


class PageSuccess implements PageState {
  const PageSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PageState.success()';
}


}




/// @nodoc


class PageFailure implements PageState {
  const PageFailure(this.message);
  

 final  String message;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageFailureCopyWith<PageFailure> get copyWith => _$PageFailureCopyWithImpl<PageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PageState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $PageFailureCopyWith<$Res> implements $PageStateCopyWith<$Res> {
  factory $PageFailureCopyWith(PageFailure value, $Res Function(PageFailure) _then) = _$PageFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PageFailureCopyWithImpl<$Res>
    implements $PageFailureCopyWith<$Res> {
  _$PageFailureCopyWithImpl(this._self, this._then);

  final PageFailure _self;
  final $Res Function(PageFailure) _then;

/// Create a copy of PageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PageFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
