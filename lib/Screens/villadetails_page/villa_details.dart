import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/villadetails_page/details_tile/villa_details_tile.dart';


class VillaDetailsPage extends StatefulWidget {
  const VillaDetailsPage({
    super.key,
    required this.details,
  });

  final Map<String, dynamic> details;

  @override
  State<VillaDetailsPage> createState() => _VillaDetailsPageState();
}

class _VillaDetailsPageState extends State<VillaDetailsPage> {

  String place = '';
  @override
  void initState() {

    if (widget.details['locationadress']['suburb'] != null) {
      place = widget.details['locationadress']['suburb'];
      return;
    } else {
      place = widget.details['locationadress']['county'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: VillaDetailsTile(
           
            size: size,
            details: widget.details,
            place: place));
  }

 
}
