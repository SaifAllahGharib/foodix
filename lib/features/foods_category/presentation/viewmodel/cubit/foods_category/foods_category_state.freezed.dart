// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foods_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodsCategoryState {

 PageState<List<FoodModel>> get getFoodsStatus; PageState<void> get updateFoodStatus; PageState<void> get deleteFoodStatus;
/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodsCategoryStateCopyWith<FoodsCategoryState> get copyWith => _$FoodsCategoryStateCopyWithImpl<FoodsCategoryState>(this as FoodsCategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodsCategoryState&&(identical(other.getFoodsStatus, getFoodsStatus) || other.getFoodsStatus == getFoodsStatus)&&(identical(other.updateFoodStatus, updateFoodStatus) || other.updateFoodStatus == updateFoodStatus)&&(identical(other.deleteFoodStatus, deleteFoodStatus) || other.deleteFoodStatus == deleteFoodStatus));
}


@override
int get hashCode => Object.hash(runtimeType,getFoodsStatus,updateFoodStatus,deleteFoodStatus);

@override
String toString() {
  return 'FoodsCategoryState(getFoodsStatus: $getFoodsStatus, updateFoodStatus: $updateFoodStatus, deleteFoodStatus: $deleteFoodStatus)';
}


}

/// @nodoc
abstract mixin class $FoodsCategoryStateCopyWith<$Res>  {
  factory $FoodsCategoryStateCopyWith(FoodsCategoryState value, $Res Function(FoodsCategoryState) _then) = _$FoodsCategoryStateCopyWithImpl;
@useResult
$Res call({
 PageState<List<FoodModel>> getFoodsStatus, PageState<void> updateFoodStatus, PageState<void> deleteFoodStatus
});


$PageStateCopyWith<List<FoodModel>, $Res> get getFoodsStatus;$PageStateCopyWith<void, $Res> get updateFoodStatus;$PageStateCopyWith<void, $Res> get deleteFoodStatus;

}
/// @nodoc
class _$FoodsCategoryStateCopyWithImpl<$Res>
    implements $FoodsCategoryStateCopyWith<$Res> {
  _$FoodsCategoryStateCopyWithImpl(this._self, this._then);

  final FoodsCategoryState _self;
  final $Res Function(FoodsCategoryState) _then;

/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getFoodsStatus = null,Object? updateFoodStatus = null,Object? deleteFoodStatus = null,}) {
  return _then(_self.copyWith(
getFoodsStatus: null == getFoodsStatus ? _self.getFoodsStatus : getFoodsStatus // ignore: cast_nullable_to_non_nullable
as PageState<List<FoodModel>>,updateFoodStatus: null == updateFoodStatus ? _self.updateFoodStatus : updateFoodStatus // ignore: cast_nullable_to_non_nullable
as PageState<void>,deleteFoodStatus: null == deleteFoodStatus ? _self.deleteFoodStatus : deleteFoodStatus // ignore: cast_nullable_to_non_nullable
as PageState<void>,
  ));
}
/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<List<FoodModel>, $Res> get getFoodsStatus {
  
  return $PageStateCopyWith<List<FoodModel>, $Res>(_self.getFoodsStatus, (value) {
    return _then(_self.copyWith(getFoodsStatus: value));
  });
}/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get updateFoodStatus {
  
  return $PageStateCopyWith<void, $Res>(_self.updateFoodStatus, (value) {
    return _then(_self.copyWith(updateFoodStatus: value));
  });
}/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get deleteFoodStatus {
  
  return $PageStateCopyWith<void, $Res>(_self.deleteFoodStatus, (value) {
    return _then(_self.copyWith(deleteFoodStatus: value));
  });
}
}


/// @nodoc


class _FoodsCategoryState implements FoodsCategoryState {
  const _FoodsCategoryState({this.getFoodsStatus = const PageState.init(), this.updateFoodStatus = const PageState.init(), this.deleteFoodStatus = const PageState.init()});
  

@override@JsonKey() final  PageState<List<FoodModel>> getFoodsStatus;
@override@JsonKey() final  PageState<void> updateFoodStatus;
@override@JsonKey() final  PageState<void> deleteFoodStatus;

/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodsCategoryStateCopyWith<_FoodsCategoryState> get copyWith => __$FoodsCategoryStateCopyWithImpl<_FoodsCategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodsCategoryState&&(identical(other.getFoodsStatus, getFoodsStatus) || other.getFoodsStatus == getFoodsStatus)&&(identical(other.updateFoodStatus, updateFoodStatus) || other.updateFoodStatus == updateFoodStatus)&&(identical(other.deleteFoodStatus, deleteFoodStatus) || other.deleteFoodStatus == deleteFoodStatus));
}


@override
int get hashCode => Object.hash(runtimeType,getFoodsStatus,updateFoodStatus,deleteFoodStatus);

@override
String toString() {
  return 'FoodsCategoryState(getFoodsStatus: $getFoodsStatus, updateFoodStatus: $updateFoodStatus, deleteFoodStatus: $deleteFoodStatus)';
}


}

/// @nodoc
abstract mixin class _$FoodsCategoryStateCopyWith<$Res> implements $FoodsCategoryStateCopyWith<$Res> {
  factory _$FoodsCategoryStateCopyWith(_FoodsCategoryState value, $Res Function(_FoodsCategoryState) _then) = __$FoodsCategoryStateCopyWithImpl;
@override @useResult
$Res call({
 PageState<List<FoodModel>> getFoodsStatus, PageState<void> updateFoodStatus, PageState<void> deleteFoodStatus
});


@override $PageStateCopyWith<List<FoodModel>, $Res> get getFoodsStatus;@override $PageStateCopyWith<void, $Res> get updateFoodStatus;@override $PageStateCopyWith<void, $Res> get deleteFoodStatus;

}
/// @nodoc
class __$FoodsCategoryStateCopyWithImpl<$Res>
    implements _$FoodsCategoryStateCopyWith<$Res> {
  __$FoodsCategoryStateCopyWithImpl(this._self, this._then);

  final _FoodsCategoryState _self;
  final $Res Function(_FoodsCategoryState) _then;

/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getFoodsStatus = null,Object? updateFoodStatus = null,Object? deleteFoodStatus = null,}) {
  return _then(_FoodsCategoryState(
getFoodsStatus: null == getFoodsStatus ? _self.getFoodsStatus : getFoodsStatus // ignore: cast_nullable_to_non_nullable
as PageState<List<FoodModel>>,updateFoodStatus: null == updateFoodStatus ? _self.updateFoodStatus : updateFoodStatus // ignore: cast_nullable_to_non_nullable
as PageState<void>,deleteFoodStatus: null == deleteFoodStatus ? _self.deleteFoodStatus : deleteFoodStatus // ignore: cast_nullable_to_non_nullable
as PageState<void>,
  ));
}

/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<List<FoodModel>, $Res> get getFoodsStatus {
  
  return $PageStateCopyWith<List<FoodModel>, $Res>(_self.getFoodsStatus, (value) {
    return _then(_self.copyWith(getFoodsStatus: value));
  });
}/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get updateFoodStatus {
  
  return $PageStateCopyWith<void, $Res>(_self.updateFoodStatus, (value) {
    return _then(_self.copyWith(updateFoodStatus: value));
  });
}/// Create a copy of FoodsCategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageStateCopyWith<void, $Res> get deleteFoodStatus {
  
  return $PageStateCopyWith<void, $Res>(_self.deleteFoodStatus, (value) {
    return _then(_self.copyWith(deleteFoodStatus: value));
  });
}
}

// dart format on
