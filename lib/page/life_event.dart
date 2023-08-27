import 'package:objectbox/objectbox.dart';

@Entity()
class LifeEvent {
  late String title;
  late int count;
  int id = 0;

  LifeEvent({
    required this.title,
    required this.count,
  });
}
