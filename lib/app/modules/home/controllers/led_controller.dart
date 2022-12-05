import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class LEDController extends GetxController {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  Rx<dynamic> _currentColor = Rx<dynamic>(null);
  String get currentColor => _currentColor.value?["color"] ?? "No Color";

  Stream<dynamic> get colorStream => databaseReference.onValue.map((event) {
        DatabaseEvent databaseEvent = event;
        return databaseEvent.snapshot.value;
      });

  Future<void> changeColor(String color) async {
    await databaseReference.set({'color': color});
  }

  @override
  void onInit() {
    _currentColor.bindStream(colorStream);
    super.onInit();
  }
}
