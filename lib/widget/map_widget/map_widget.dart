import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kalliyath_villa/widget/map_widget/functions.dart';
import 'package:latlong2/latlong.dart';

mapwidget({required Size size, required Map<String, dynamic> details}) {
  return Padding(
    padding: const EdgeInsets.only(right: 30, top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            height: size.height / 7,
            width: size.width / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlutterMap(
                  options: MapOptions(
                      onTap: (tapPosition, point) {
                        checkLocationPermission(details['location']['latitude'],
                            details['location']['longitude']);
                      },
                      initialZoom: 14.5,
                      initialCenter: LatLng(details['location']['latitude'],
                          details['location']['longitude']),
                      interactionOptions: const InteractionOptions(
                          flags: ~InteractiveFlag.doubleTapDragZoom)),
                  children: [
                    openmap,
                    MarkerLayer(markers: [
                      Marker(
                          point: LatLng(details['location']['latitude'],
                              details['location']['longitude']),
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.location_on,
                            size: 35,
                            color: Color.fromARGB(255, 255, 39, 24),
                          ))
                    ])
                  ]),
            )),
      ],
    ),
  );
}
