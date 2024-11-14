import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/map/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  MapView({super.key});

  var controller = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///App Bar...
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: CommonUi.commonText('Arenas',
            fontFamily: Fonts.semiBold,
            fontSize: 18.0,
            color: AppColor.primaryColor),
      ),
      body: Column(
        children: [
          ///Space...
          const SizedBox(
            height: 15,
          ),

          ///Space Row...
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 20.0, top: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    width: 50,
                    color: AppColor.softSky,
                    child: Row(
                      children: [
                        ///Search Icon...
                        const Icon(Icons.search),

                        ///Search Text...
                        CommonUi.commonText(' Search',
                            fontFamily: Fonts.gantariMedium,
                            fontSize: 14.0,
                            color: AppColor.primaryColor),
                      ],
                    ),
                  ),
                ),

                ///Spacer....
                const SizedBox(
                  width: 9,
                ),

                ///List Container....
                Container(
                  height: 40,
                  width: 50,
                  color: AppColor.softSky,
                  child: Center(
                    child: CommonUi.commonText('List',
                        fontFamily: Fonts.gantariMedium,
                        fontSize: 14.0,
                        color: AppColor.primaryColor),
                  ),
                ),
              ],
            ),
          ),

          ///Map....
          GetBuilder(
            builder: (MapController controller) {
              return Expanded(
                child: GoogleMap(
                  onMapCreated: (controllerMaps) {
                    controller.mapController = controllerMaps;
                    controller.getLocation();
                  },
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: controller.currentPosition.value,
                    zoom: 4,
                  ),
                  markers: controller.markers
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
