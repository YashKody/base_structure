import 'package:objectbox/objectbox.dart';

@Entity()
class Dummy {
  @Id()
  int id;

  Dummy({required this.id});
}