// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VerificationState {

 PageState<bool> get status; bool get isEmailVerificationSend; int get time; bool get canSend;
/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationStateCopyWith<VerificationState> get copyWith => _$VerificationStateCopyWithImpl<VerificationState>(this as VerificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationState&&(identical(other.status, status) || other.status == status)&&(identical(other.isEmailVerificationSend, isEmailVerificationSend) || other.isEmailVerificationSend == isEmailVerificationSend)&&(identical(other.time, time) || other.time == time)&&(identical(other.canSend, canSend) || other.canSend == canSend));
}


@override
int get hashCode => Object.hash(runtimeType,status,isEmailVerificationSend,time,canSend);

@override
String toString() {
  return 'VerificationState(status: $status, isEmailVerificationSend: $isEmailVerificationSend, time: $time, canSend: $canSend)';
}


}

/// @nodoc
abstract mixin class $VerificationStateCopyWith<$Res>  {
  factory $VerificationStateCopyWith(VerificationState value, $Res Function(VerificationState) _then) = _$VerificationStateCopyWithImpl;
@useResult
$Res call({
 PageState<bool> status, bool isEmailVerificationSend, int time, bool canSend
});


$PageStateCopyWith<bool, $Res> get status;

}
/// @nodoc
class _$VerificationStateCopyWithImpl<$Res>
    implements $VerificationStateCopyWith<$Res> {
  _$VerificationStateCopyWithImpl(this._self, this._then);

  final VerificationState _self;
  final $Res Function(VerificationState) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isEmailVerificationSend = null,Object? time = null,Object? canSend = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState<bool>,isEmailVerificationSend: null == isEmailVerificationSend ? _self.isEmailVerificationSend : isEmailVerificationSend // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,canSend: null == canSend ? _self.canSend : canSend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<bool, $Res> get status {
  
  return $PageStateCopyWith<bool, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc


class _VerificationState implements VerificationState {
  const _VerificationState({this.status = const PageState.init(), this.isEmailVerificationSend = false, this.time = 60, this.canSend = false});
  

@override@JsonKey() final  PageState<bool> status;
@override@JsonKey() final  bool isEmailVerificationSend;
@override@JsonKey() final  int time;
@override@JsonKey() final  bool canSend;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationStateCopyWith<_VerificationState> get copyWith => __$VerificationStateCopyWithImpl<_VerificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationState&&(identical(other.status, status) || other.status == status)&&(identical(other.isEmailVerificationSend, isEmailVerificationSend) || other.isEmailVerificationSend == isEmailVerificationSend)&&(identical(other.time, time) || other.time == time)&&(identical(other.canSend, canSend) || other.canSend == canSend));
}


@override
int get hashCode => Object.hash(runtimeType,status,isEmailVerificationSend,time,canSend);

@override
String toString() {
  return 'VerificationState(status: $status, isEmailVerificationSend: $isEmailVerificationSend, time: $time, canSend: $canSend)';
}


}

/// @nodoc
abstract mixin class _$VerificationStateCopyWith<$Res> implements $VerificationStateCopyWith<$Res> {
  factory _$VerificationStateCopyWith(_VerificationState value, $Res Function(_VerificationState) _then) = __$VerificationStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<bool> status, bool isEmailVerificationSend, int time, bool canSend
});


@override $PageStateCopyWith<bool, $Res> get status;

}
/// @nodoc
class __$VerificationStateCopyWithImpl<$Res>
    implements _$VerificationStateCopyWith<$Res> {
  __$VerificationStateCopyWithImpl(this._self, this._then);

  final _VerificationState _self;
  final $Res Function(_VerificationState) _then;

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isEmailVerificationSend = null,Object? time = null,Object? canSend = null,}) {
  return _then(_VerificationState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PageState<bool>,isEmailVerificationSend: null == isEmailVerificationSend ? _self.isEmailVerificationSend : isEmailVerificationSend // ignore: cast_nullable_to_non_nullable
as bool,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,canSend: null == canSend ? _self.canSend : canSend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VerificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<bool, $Res> get status {
  
  return $PageStateCopyWith<bool, $Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

// dart format on
