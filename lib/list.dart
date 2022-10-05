import 'package:flutter_projetc_lesson_36/images/resources.dart';

class ObjectView {
  final String image;
  final String title;
  final String subtitle;
  ObjectView({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<ObjectView> item = [
  ObjectView(
    image: Images.screen1,
    title: '1',
    subtitle: '2',
  ),
  ObjectView(
    image: Images.screen2,
    title: '11',
    subtitle: '22',
  ),
];
