import 'package:designs/common/languages/custom_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/custom_booking.dart';

class HomeController extends GetxController{

  var bookingList = [
    const CustomBooking(
      title: 'Livery Yard',
      date: '12 Oct 2024',
      time: '07:30PM',
      subTitle: 'Riding arena',
    ),
    const CustomBooking(
      title: 'Starlight Stables',
      date: '28 Oct 2024',
      time: '07:30PM',
      subTitle: 'Echo Valley Arena',
    ),
    const CustomBooking(
      title: 'Whispering Pines',
      date: '12 Oct 2024',
      time: '07:30PM',
      subTitle: 'Echo Valley Arena',
    ),
  ].obs;

  var locations = <CustomLocation>[].obs;

  @override
  void onInit() {
    locations.addAll([
      const CustomLocation(
        'thunder',
        title: 'Thunderhoof Arena',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at',
        price: '100',
      ),
      const CustomLocation(
        'thunder',
        title: 'Starlight Stables',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price:  '200',
      ),
      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),

      const CustomLocation(
        'thunder',
        title: 'Whispering Pines',
        location: 'Marshall, Virginia',
        subTitle: 'Starting at ',
        price: '150',
      ),
    ]);
    super.onInit();
  }

}