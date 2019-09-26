///
/// A data class to keep the information for scooter.
///
class Scooter {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final int batteryLevel;
  final int price;
  final int priceTime;
  final String currency;

  Scooter(
      {this.id,
        this.name,
        this.description,
        this.latitude,
        this.longitude,
        this.batteryLevel,
        this.price,
        this.priceTime,
        this.currency});

  factory Scooter.fromJson(Map<String, dynamic> json) {
    return Scooter(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      batteryLevel: json['batteryLevel'],
      price: json['price'],
      priceTime: json['priceTime'],
      currency: json['currency'],
    );
  }
}