import 'dart:math';

class MockService {
  MockService({required this.evenNumberService});

  final IsEventNumberService evenNumberService;

  int getRandomEvenNumber() {
    bool isEvenNumber = false;
    int number;

    do {
      number = Random().nextInt(100);
      isEvenNumber = evenNumberService.isEvenNumber(number);
    } while (!isEvenNumber);

    return number;
  }
}

abstract class IsEventNumberService {
  bool isEvenNumber(int number);
}

class IsEventNumberServiceImpl extends IsEventNumberService {
  @override
  bool isEvenNumber(int number) {
    return number % 2 == 0;
  }
}
