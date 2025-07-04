// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 PageState get status; bool get buttonEnabled;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.status, status) || other.status == status)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,status,buttonEnabled);

@override
String toString() {
  return 'LoginState(status: $status, buttonEnabled: $buttonEnabled)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 PageState status, bool buttonEnabled
});


$PageStateCopyWith<$Res> get status;

}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? buttonEnabled = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<$Res> get status {
  
  return $PageStateCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.status = const PageState.init(), this.buttonEnabled = false});
  

@override@JsonKey() final  PageState status;
@override@JsonKey() final  bool buttonEnabled;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.status, status) || other.status == status)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,status,buttonEnabled);

@override
String toString() {
  return 'LoginState(status: $status, buttonEnabled: $buttonEnabled)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 PageState status, bool buttonEnabled
});


@override $PageStateCopyWith<$Res> get status;

}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? buttonEnabled = null,}) {
  return _then(_LoginState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<$Res> get status {
  
  return $PageStateCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
