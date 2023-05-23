// ignore_for_file: file_names, unnecessary_null_comparison

List<String> getHoroscope(DateTime dateOfBirth) {
  int day = dateOfBirth.day;
  int month = dateOfBirth.month;

  List<String> horoscope = [];

  if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
    horoscope = ['Aquarius', 'Водолей'];
  } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
    horoscope = ['Pisces', 'Рыбы'];
  } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
    horoscope = ['Aries', 'Овен'];
  } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
    horoscope = ['Taurus', 'Телец'];
  } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
    horoscope = ['Gemini', 'Близнецы'];
  } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
    horoscope = ['Cancer', 'Рак'];
  } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
    horoscope = ['Leo', 'Лев'];
  } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
    horoscope = ['Virgo', 'Дева'];
  } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
    horoscope = ['Libra', 'Весы'];
  } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
    horoscope = ['Scorpio', 'Скорпион'];
  } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
    horoscope = ['Sagittarius', 'Стрелец'];
  } else {
    horoscope = ['Capricorn', 'Козерог'];
  }
  return horoscope;
}

final horoscopesImages = {
  "Aquarius": 'assets/svg/aquarius.svg',
  'Pisces': 'assets/svg/pisces.svg',
  'Aries': 'assets/svg/aries.svg',
  'Taurus': 'assets/svg/taurus.svg',
  'Gemini': 'assets/svg/gemini.svg',
  'Cancer': 'assets/svg/cancer.svg',
  'Leo': 'assets/svg/leo.svg',
  'Virgo': 'assets/svg/virgo.svg',
  'Libra': 'assets/svg/libra.svg',
  'Scorpio': 'assets/svg/scorpio.svg',
  'Sagittarius': 'assets/svg/sagittarius.svg',
  'Capricorn': 'assets/svg/capricorn.svg',
  'error': 'assets/svg/error.svg'
};

String getHoroscopeSvg(String horoscope) {
  if (horoscopesImages != null && horoscopesImages[horoscope] != null) {
    return horoscopesImages[horoscope] as String;
  }
  return 'bad';
}

// DateTime dateOfBirth = DateTime(1990, 3, 15);
// String horoscope = getHoroscope(dateOfBirth);
// print(horoscope); // Output: Aries