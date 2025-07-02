enum RestaurantInfoParams {
  id("restaurantId"),
  restaurantName("restaurantName"),
  deliveryTime("restaurantDeliveryTime"),
  deliveryCost("restaurantDeliveryCost"),
  openTime("restaurantOpenTime"),
  closeTime("restaurantCloseTime");

  final String _value;

  const RestaurantInfoParams(this._value);

  @override
  String toString() => _value;
}
