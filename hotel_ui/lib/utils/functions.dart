import 'package:flutter_share/flutter_share.dart';
import 'package:hotel_ui/attributes.dart';

import '../models/hotelModel.dart';

List<HotelModel> searchHotel(String searchedStr) {
  searchedList.clear();
  categoryList.forEach((category) {
    category.hotels.forEach((hotel) {
      if (hotel.hotelName.toLowerCase().contains(searchedStr.toLowerCase())) {
        searchedList.add(hotel);
      }
    });
  });
  return searchedList;
}


Future<void> share(String name, String url) async {
  await FlutterShare.share(
      title: name,
      text: name,
      linkUrl: url,
      chooserTitle: 'Ilmhub'
  );
}