class RoomModel{
  String uid;
  String lodgeID;
  String roomNumber;
  String description;
  List<String>amenities;
  List<String>images;

  RoomModel({
    required this.uid,
    required this.roomNumber,
    required this.images,
    required this.description,
    required this.amenities,
    required this.lodgeID
  });
}