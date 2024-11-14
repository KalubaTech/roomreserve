import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:roomreserve/controllers/lodges_controller.dart';
import 'package:roomreserve/models/lodge_model.dart';


class DataFetcher {

  var _finstance = FirebaseFirestore.instance;

  LodgeController _lodgeController = Get.find();


  void fetchLodges()async{
      List<LodgeModel> lodges = [];
      var lodgesData = await _finstance.collection('lodge').get();//will change according to location when applied as criteria

      for(var lodgeDoc in lodgesData.docs){
          LodgeModel lodge = LodgeModel(
              uid: lodgeDoc.id, 
              name: lodgeDoc.get('name'),
              email: lodgeDoc.get('email'),
              phone: lodgeDoc.get('phone'),
              address: lodgeDoc.get('address'),
              district: lodgeDoc.get('district'),
              province: lodgeDoc.get('province'),
              latlng: lodgeDoc.get('latlng'),
              datetime: lodgeDoc.get('datetime'),
          );

          lodges.add(lodge);
      }

    _lodgeController.lodges.value = lodges;

  }

}