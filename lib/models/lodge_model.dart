class LodgeModel {
  String uid;
  String name;
  double latitude;
  double longitude;
  String phone;
  String? image;


  LodgeModel({
    required this.uid,
    required this.name,
    required this.phone,
    required this.image,
    required this.latitude,
    required this.longitude
  });
}