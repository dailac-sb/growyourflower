import 'dart:math';

CalcPrice(int levelStem, int gradeStem) {
  double price = 0.0;
  price = 0.5 * pow(1.2, levelStem) * (1 + gradeStem * 20);
  return price;
}

CalcMining(int levelStem, int gradeStem) {
  double mining = 0.0;
  mining = 0.1 * pow(1.1, levelStem) * (1 + gradeStem * 20);
  return mining;
}
