Thousand(double a) {
  int counterThousand = 0;
  int b = 0;
  String newA = '';
  final List<String> keyValue = [
    'K',
    'M',
    'B',
    'T',
    'Qa',
    'Qi',
    'Sx',
    'Sp',
    'O',
    'N',
    'D',
    'Ud',
    'Dd',
    'Td',
    'Qd',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  if (a >= 1000) {
    for (counterThousand = 0; a >= 1000.0; counterThousand++) {
      a = a / 1000;
      b = counterThousand + 1;
    }
    if (b < 41) {
      newA = a.toStringAsFixed(2) + keyValue[b];
    } else
      newA = a.toStringAsFixed(2) + 'много!';
  } else if (a < 1000) newA = a.toStringAsFixed(2);
  return newA;
}
