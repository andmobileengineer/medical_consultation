import 'package:flutter/material.dart';
import 'package:medical_consultation_app/presentation/home/widgets/quick_link_item.dart';
import 'package:medical_consultation_app/presentation/home/widgets/quick_link.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/strings.dart';

class QuickLinks extends StatelessWidget {
  const QuickLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        QuickLinkItem(
          title: Strings.hospital,
          icon: QuickLink(
            icon: const Icon(Icons.contact_mail,
                color: ApplicationColors.reddish),
            action: () {},
          ),
          // enabled: (ampCard != null && ampCard!.payReady),
        ),
        QuickLinkItem(
          title: Strings.consultant,
          icon: QuickLink(
            icon: const Icon(
              Icons.monitor_heart,
              color: ApplicationColors.blueDress,
            ),
            action: () {},
          ),
        ),
        QuickLinkItem(
          title: Strings.recipe,
          icon: QuickLink(
            icon: const Icon(Icons.receipt, color: ApplicationColors.yellow),
            action: () {},
          ),
        ),
        QuickLinkItem(
          title: Strings.appointment,
          icon: QuickLink(
            icon: const Icon(
              Icons.meeting_room,
              color: ApplicationColors.greenHaze,
            ),
            action: () {},
          ),
        ),
      ],
    );
  }
}
