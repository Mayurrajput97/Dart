import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:practice_work/features/patient/data/model/doctor_model.dart';
import 'package:practice_work/features/patient/presentation/pages/doctor_details_page.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorTile({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 200;

        double avatarRadius = isSmallScreen ? 30 : 40;
        double nameFontSize = isSmallScreen ? 14 : 18;
        double specializationFontSize = isSmallScreen ? 12 : 14;
        double ratingBarSize = isSmallScreen ? 12 : 16;
        double spacing = isSmallScreen ? 8 : 12;

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorDetailPage(doctor: doctor),
              ),
            );
          },
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(doctor.image),
                        radius: avatarRadius,
                      ),
                      SizedBox(width: spacing),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctor.name,
                              style: TextStyle(
                                fontSize: nameFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: isSmallScreen ? 1 : 2,
                            ),
                            SizedBox(height: spacing / 2),
                            Text(
                              doctor.specialization,
                              style: TextStyle(
                                fontSize: specializationFontSize,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            SizedBox(height: spacing),
                            RatingBar.builder(
                              initialRating: doctor.rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: ratingBarSize,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
