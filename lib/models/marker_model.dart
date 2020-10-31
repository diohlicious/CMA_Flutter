import 'package:google_maps_flutter/google_maps_flutter.dart';

//
// extending the google map marker to add more information
// to it
class MarkerModel extends Marker {
  final String name;
  final String desc;

  MarkerModel(this.name, this.desc, {MarkerId id, lat, lng, onTap})
      : super(
    markerId: id,
    position: LatLng(
      lat,
      lng,
    ),
    infoWindow: InfoWindow(title: name, snippet: desc),
    onTap: onTap,
  );
}
