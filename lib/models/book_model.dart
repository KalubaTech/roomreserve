
import 'package:roomreserve/models/room_model.dart';
import 'package:roomreserve/models/user_model.dart';

class BookModel {
  RoomModel room;
  UserModel user;
  List nights;
  String totalPrice;
  String dateBooked;
  String status;

  BookModel({required this.room, required this.user, required this.nights, required this.totalPrice, required this.dateBooked, required this.status});
}