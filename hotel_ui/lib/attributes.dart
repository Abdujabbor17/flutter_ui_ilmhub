import 'package:hotel_ui/models/hotelModel.dart';

import 'models/categoryModel.dart';

List<CategoryModel> categoryList = [
  CategoryModel(
      categoryName: 'Best Hotels',
      hotels: [
    HotelModel('https://hotels.sletat.ru/i/f/103145_0.jpg', 'Wyndham grand'),
    HotelModel(
        'https://ak-d.tripcdn.com/images/22090f0000007kt4e1864.jpg',
        'HILTON'),
    HotelModel(
        'https://i.pinimg.com/originals/fb/2e/4b/fb2e4b40ce3f441575cd266348728ef5.jpg',
        'Kempinski'),
        HotelModel(
            'https://i.pinimg.com/originals/fb/2e/4b/fb2e4b40ce3f441575cd266348728ef5.jpg',
            'Kempinski'),
  ]),

  CategoryModel(
      categoryName: 'Luxury Hotels',
      hotels: [
        HotelModel('https://avatars.mds.yandex.net/get-altay/1363707/2a00000164edf2e1192f4be0bb0563bdffb0/XXXL', 'Western'),
        HotelModel(
            'https://kompastour.com/useruploads/hotels/hotel_64f98eddc4.jpg',
            'City Palace'),
        HotelModel(
            'https://q-xx.bstatic.com/xdata/images/hotel/max1024x768/193517948.jpg?k=4309224c80dbc0b9dc3ca06364a09cbd687f9d1c90ae78a2d2aa23097a12f88c&o=',
            'Uzbekistan'),
      ]),

  CategoryModel(
      categoryName: 'Expensive Hotels',
      hotels: [
        HotelModel('https://hotels.sletat.ru/i/f/103145_0.jpg', 'Hyatt Regency'),
        HotelModel(
            'https://ak-d.tripcdn.com/images/22090f0000007kt4e1864.jpg',
            'Hampton'),
        HotelModel(
            'https://i.pinimg.com/originals/fb/2e/4b/fb2e4b40ce3f441575cd266348728ef5.jpg',
            'Sahro'),
      ]),



];

List<HotelModel> searchedList = [];
