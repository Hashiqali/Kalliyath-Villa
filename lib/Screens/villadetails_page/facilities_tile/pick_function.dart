Map<String, Map<String, String>> facilitiesitems = {
  'ac': {'image': 'assets/images/facilities/air-conditioner.png', 'name': "Ac"},
  'fitness': {
    'image': 'assets/images/facilities/dumbbell.png',
    'name': "Fitness"
  },
  'wifi': {'image': 'assets/images/facilities/wi-fi.png', 'name': "Wifi"},
  'spa': {'image': 'assets/images/facilities/massage.png', 'name': "Spa"},
  'parking': {
    'image': 'assets/images/facilities/parking-area.png',
    'name': "Parking"
  },
  'playground': {
    'image': 'assets/images/facilities/playground.png',
    'name': "Play Ground"
  },
  'swimmingpool': {
    'image': 'assets/images/facilities/swimming.png',
    'name': "Pool"
  },
  'tv': {'image': 'assets/images/facilities/television.png', 'name': "Tv"},
};


pickfacilities(List<Map<String, dynamic>>? villaList) async {
  for (int i = 0; i < villaList!.length; i++) {
    List<Map<String, String>> item = [];

    Map<String, dynamic> data = villaList[i];
    for (String key in data.keys) {
      if (data[key] == true) {
        Map<String, String>? facility = facilitiesitems[key];
        if (facility != null) {
          item.add(facility);
        }
      }
    }
    data['facilities'] = item;
  }

  return villaList;
}
