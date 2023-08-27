import 'package:objectbox/objectbox.dart';

@Entity()
class LifeEvent {
  LifeEvent({
    required this.title,
    required this.count,
  });

  String title;
  int count;
  int id = 0;
}
