import 'package:dalil_syria/features/trips/data/models/trip_details_model.dart';
import 'package:flutter/material.dart';

class TripHeader extends StatelessWidget {
  final TripDetailsModel trip;
  const TripHeader({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    const titleColor = Color(0xFF1B1E28);
    const textColor = Color(0xFF7D848D);
    const primaryColor = Color(0xFF0D6EFD);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                trip.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
            Text(
              "\$${trip.price}",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 16, color: textColor),
            SizedBox(width: 4),
            Text("${trip.location}", style: TextStyle(color: textColor)),
          ],
        ),
      ],
    );
  }
}
