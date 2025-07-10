import 'package:flutter_test/flutter_test.dart';
import 'package:cake_it_app/src/features/cake/domain/cake.dart';

void main() {
  group('Cake Model', () {
    test('fromJson creates correct Cake object', () {
      final json = {
        'title': 'Dundee Cake',
        'desc': 'A staple with Dundonians',
        'image': 'http://example.com/dundee_cake.png',
      };
      final cake = Cake.fromJson(json);

      expect(cake.title, 'Dundee Cake');
      expect(cake.description, 'A staple with Dundonians');
      expect(cake.image, 'http://example.com/dundee_cake.png');
    });

    test('toJson returns correct map', () {
      const cake = Cake(
        title: 'Donut',
        description: 'Not technically a cake',
        image: 'http://example.com/donut.png',
      );
      final json = cake.toJson();

      expect(json['title'], 'Donut');
      expect(json['desc'], 'Not technically a cake');
      expect(json['image'], 'http://example.com/donut.png');
    });
  });
}
