// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_restaurant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyRestaurantState {

  PageState<RestaurantModel> get status;

  bool get isValidate;

  bool get nameUpdated;

  bool get timeDeliveryUpdated;

  bool get costDeliveryUpdated;

  bool get openTimeUpdated;

  bool get closeTimeUpdated;

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyRestaurantStateCopyWith<MyRestaurantState> get copyWith =>
      _$MyRestaurantStateCopyWithImpl<MyRestaurantState>(
          this as MyRestaurantState, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MyRestaurantState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValidate, isValidate) ||
                other.isValidate == isValidate) &&
            (identical(other.nameUpdated, nameUpdated) ||
                other.nameUpdated == nameUpdated) &&
            (identical(other.timeDeliveryUpdated, timeDeliveryUpdated) ||
                other.timeDeliveryUpdated == timeDeliveryUpdated) &&
            (identical(other.costDeliveryUpdated, costDeliveryUpdated) ||
                other.costDeliveryUpdated == costDeliveryUpdated) &&
            (identical(other.openTimeUpdated, openTimeUpdated) ||
                other.openTimeUpdated == openTimeUpdated) &&
            (identical(other.closeTimeUpdated, closeTimeUpdated) ||
                other.closeTimeUpdated == closeTimeUpdated));
  }


  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          status,
          isValidate,
          nameUpdated,
          timeDeliveryUpdated,
          costDeliveryUpdated,
          openTimeUpdated,
          closeTimeUpdated);

  @override
  String toString() {
    return 'MyRestaurantState(status: $status, isValidate: $isValidate, nameUpdated: $nameUpdated, timeDeliveryUpdated: $timeDeliveryUpdated, costDeliveryUpdated: $costDeliveryUpdated, openTimeUpdated: $openTimeUpdated, closeTimeUpdated: $closeTimeUpdated)';
  }


}

/// @nodoc
abstract mixin class $MyRestaurantStateCopyWith<$Res> {
  factory $MyRestaurantStateCopyWith(MyRestaurantState value,
      $Res Function(MyRestaurantState) _then) = _$MyRestaurantStateCopyWithImpl;

  @useResult
  $Res call({
    PageState<
        RestaurantModel> status, bool isValidate, bool nameUpdated, bool timeDeliveryUpdated, bool costDeliveryUpdated, bool openTimeUpdated, bool closeTimeUpdated
  });


  $PageStateCopyWith<RestaurantModel, $Res> get status;

}

/// @nodoc
class _$MyRestaurantStateCopyWithImpl<$Res>
    implements $MyRestaurantStateCopyWith<$Res> {
  _$MyRestaurantStateCopyWithImpl(this._self, this._then);

  final MyRestaurantState _self;
  final $Res Function(MyRestaurantState) _then;

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? status = null, Object? isValidate = null, Object? nameUpdated = null, Object? timeDeliveryUpdated = null, Object? costDeliveryUpdated = null, Object? openTimeUpdated = null, Object? closeTimeUpdated = null,}) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
      as PageState<RestaurantModel>,
      isValidate: null == isValidate
          ? _self.isValidate
          : isValidate // ignore: cast_nullable_to_non_nullable
      as bool,
      nameUpdated: null == nameUpdated
          ? _self.nameUpdated
          : nameUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      timeDeliveryUpdated: null == timeDeliveryUpdated
          ? _self.timeDeliveryUpdated
          : timeDeliveryUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      costDeliveryUpdated: null == costDeliveryUpdated
          ? _self.costDeliveryUpdated
          : costDeliveryUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      openTimeUpdated: null == openTimeUpdated
          ? _self.openTimeUpdated
          : openTimeUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      closeTimeUpdated: null == closeTimeUpdated
          ? _self.closeTimeUpdated
          : closeTimeUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageStateCopyWith<RestaurantModel, $Res> get status {
    return $PageStateCopyWith<RestaurantModel, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}


/// @nodoc


class _MyRestaurantState implements MyRestaurantState {
  const _MyRestaurantState({this.status = const PageState
      .init(), this.isValidate = false, this.nameUpdated = false, this.timeDeliveryUpdated = false, this.costDeliveryUpdated = false, this.openTimeUpdated = false, this.closeTimeUpdated = false});


  @override
  @JsonKey()
  final PageState<RestaurantModel> status;
  @override
  @JsonKey()
  final bool isValidate;
  @override
  @JsonKey()
  final bool nameUpdated;
  @override
  @JsonKey()
  final bool timeDeliveryUpdated;
  @override
  @JsonKey()
  final bool costDeliveryUpdated;
  @override
  @JsonKey()
  final bool openTimeUpdated;
  @override
  @JsonKey()
  final bool closeTimeUpdated;

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyRestaurantStateCopyWith<_MyRestaurantState> get copyWith =>
      __$MyRestaurantStateCopyWithImpl<_MyRestaurantState>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MyRestaurantState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValidate, isValidate) ||
                other.isValidate == isValidate) &&
            (identical(other.nameUpdated, nameUpdated) ||
                other.nameUpdated == nameUpdated) &&
            (identical(other.timeDeliveryUpdated, timeDeliveryUpdated) ||
                other.timeDeliveryUpdated == timeDeliveryUpdated) &&
            (identical(other.costDeliveryUpdated, costDeliveryUpdated) ||
                other.costDeliveryUpdated == costDeliveryUpdated) &&
            (identical(other.openTimeUpdated, openTimeUpdated) ||
                other.openTimeUpdated == openTimeUpdated) &&
            (identical(other.closeTimeUpdated, closeTimeUpdated) ||
                other.closeTimeUpdated == closeTimeUpdated));
  }


  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          status,
          isValidate,
          nameUpdated,
          timeDeliveryUpdated,
          costDeliveryUpdated,
          openTimeUpdated,
          closeTimeUpdated);

  @override
  String toString() {
    return 'MyRestaurantState(status: $status, isValidate: $isValidate, nameUpdated: $nameUpdated, timeDeliveryUpdated: $timeDeliveryUpdated, costDeliveryUpdated: $costDeliveryUpdated, openTimeUpdated: $openTimeUpdated, closeTimeUpdated: $closeTimeUpdated)';
  }


}

/// @nodoc
abstract mixin class _$MyRestaurantStateCopyWith<$Res>
    implements $MyRestaurantStateCopyWith<$Res> {
  factory _$MyRestaurantStateCopyWith(_MyRestaurantState value,
      $Res Function(_MyRestaurantState) _then) = __$MyRestaurantStateCopyWithImpl;

  @override
  @useResult
  $Res call({
    PageState<
        RestaurantModel> status, bool isValidate, bool nameUpdated, bool timeDeliveryUpdated, bool costDeliveryUpdated, bool openTimeUpdated, bool closeTimeUpdated
  });


  @override $PageStateCopyWith<RestaurantModel, $Res> get status;

}

/// @nodoc
class __$MyRestaurantStateCopyWithImpl<$Res>
    implements _$MyRestaurantStateCopyWith<$Res> {
  __$MyRestaurantStateCopyWithImpl(this._self, this._then);

  final _MyRestaurantState _self;
  final $Res Function(_MyRestaurantState) _then;

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? status = null, Object? isValidate = null, Object? nameUpdated = null, Object? timeDeliveryUpdated = null, Object? costDeliveryUpdated = null, Object? openTimeUpdated = null, Object? closeTimeUpdated = null,}) {
    return _then(_MyRestaurantState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
      as PageState<RestaurantModel>,
      isValidate: null == isValidate
          ? _self.isValidate
          : isValidate // ignore: cast_nullable_to_non_nullable
      as bool,
      nameUpdated: null == nameUpdated
          ? _self.nameUpdated
          : nameUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      timeDeliveryUpdated: null == timeDeliveryUpdated
          ? _self.timeDeliveryUpdated
          : timeDeliveryUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      costDeliveryUpdated: null == costDeliveryUpdated
          ? _self.costDeliveryUpdated
          : costDeliveryUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      openTimeUpdated: null == openTimeUpdated
          ? _self.openTimeUpdated
          : openTimeUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
      closeTimeUpdated: null == closeTimeUpdated
          ? _self.closeTimeUpdated
          : closeTimeUpdated // ignore: cast_nullable_to_non_nullable
      as bool,
    ));
  }

  /// Create a copy of MyRestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PageStateCopyWith<RestaurantModel, $Res> get status {
    return $PageStateCopyWith<RestaurantModel, $Res>(_self.status, (value) {
      return _then(_self.copyWith(status: value));
    });
  }
}

// dart format on
