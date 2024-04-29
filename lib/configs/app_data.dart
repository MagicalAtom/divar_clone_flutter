
import 'package:sanjagh/data/models/City.dart';
import 'package:sanjagh/data/models/Province.dart';


class Iran {

Map<String, dynamic> iranProvincesAndCities = {
  'تهران': {
    'capital': 'تهران',
    'cities': ['تهران', 'شهریار', 'اسلام‌شهر', 'ملارد', 'ورامین', 'پاکدشت', 'رباط‌کریم', 'قدس', 'بهارستان']
  },
  'خراسان رضوی': {
    'capital': 'مشهد',
    'cities': ['مشهد', 'نیشابور', 'سبزوار', 'تربت حیدریه', 'قوچان', 'گناباد', 'فریمان', 'تایباد', 'تربت جام', 'خواف']
  },
  'اصفهان': {
    'capital': 'اصفهان',
    'cities': ['اصفهان', 'کاشان', 'خمینی‌شهر', 'نجف‌آباد', 'لنجان', 'فلاورجان', 'شاهین‌شهر', 'مبارکه', 'نائین', 'آران و بیدگل']
  },
  // ... لیست کامل استان‌ها و شهرهایشان
  // این موارد فقط برای نمونه در این قسمت قرار گرفته است
};



List<Province> Provinces = [
  Province(id: '1', name: 'تهران'),
  Province(id: '2', name: 'خراسان رضوی'),
  Province(id: '3', name: 'اصفهان')
];


List<City> cities = [];



void createCities() {
  iranProvincesAndCities.forEach((key, value) {
    switch (key) {
      case 'تهران':
        addCities(iranProvincesAndCities[key]['cities'], '1');
        break;
      case 'خراسان رضوی':
        addCities(iranProvincesAndCities[key]['cities'], '2');
        break;
      case 'اصفهان':
        addCities(iranProvincesAndCities[key]['cities'], '3');
        break;
      default:
        break;
    }
  });
}
void addCities(List<String> cities, String provinceId) {
  for (var city in cities) {
    this.cities.add(City(id: (this.cities.length + 1).toString(),name: city, province_id: provinceId));
  }
}

}


Iran iran = Iran()..createCities();

