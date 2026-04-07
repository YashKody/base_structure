import 'package:base_structure/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

class ObjectboxHelper {
  late final Store store;

  ObjectboxHelper._create(this.store) {
    
  }

  static Future <ObjectboxHelper> initObjectBox () async {
    final store = await openStore();
    return ObjectboxHelper._create(store);
  }
}