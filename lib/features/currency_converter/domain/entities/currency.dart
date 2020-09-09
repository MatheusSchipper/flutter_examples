import 'package:meta/meta.dart';

class Currency {
  final String name;
  final double buy;
  final double sell;
  final double variation;

  Currency({
    @required this.name,
    @required this.buy,
    @required this.sell,
    @required this.variation,
  });
}
