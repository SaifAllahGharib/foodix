enum RestaurantInfoParams {
  id("id"),
  restaurantName("restaurantName"),
  deliveryTime("deliveryTime"),
  deliveryCost("deliveryCost"),
  openTime("openTime"),
  closeTime("closeTime");

  final String _value;

  const RestaurantInfoParams(this._value);

  @override
  String toString() => _value;
}
