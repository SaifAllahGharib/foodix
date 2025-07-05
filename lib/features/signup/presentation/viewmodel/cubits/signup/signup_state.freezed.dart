// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {

 PageState get status; bool get buttonEnabled; String get msg;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.status, status) || other.status == status)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,status,buttonEnabled,msg);

@override
String toString() {
  return 'SignupState(status: $status, buttonEnabled: $buttonEnabled, msg: $msg)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 PageState status, bool buttonEnabled, String msg
});


$PageStateCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? buttonEnabled = null,Object? msg = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<dynamic, $Res> get status {
  
  return $PageStateCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _SignupState implements SignupState {
  const _SignupState({this.status = const PageState.init(), this.buttonEnabled = false, this.msg = ""});
  

@override@JsonKey() final  PageState status;
@override@JsonKey() final  bool buttonEnabled;
@override@JsonKey() final  String msg;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.status, status) || other.status == status)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled)&&(identical(other.msg, msg) || other.msg == msg));
}


@override
int get hashCode => Object.hash(runtimeType,status,buttonEnabled,msg);

@override
String toString() {
  return 'SignupState(status: $status, buttonEnabled: $buttonEnabled, msg: $msg)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, bool buttonEnabled, String msg
});


@override $PageStateCopyWith<dynamic, $Res> get status;

}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? buttonEnabled = null,Object? msg = null,}) {
  return _then(_SignupState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<dynamic, $Res> get status {
  
  return $PageStateCopyWith<dynamic, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
