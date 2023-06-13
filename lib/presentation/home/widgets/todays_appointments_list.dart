import 'package:card_stack_widget/model/card_model.dart';
import 'package:card_stack_widget/model/card_orientation.dart';
import 'package:card_stack_widget/widget/card_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_consultation_app/application/home/appointments_cubit.dart';
import 'package:medical_consultation_app/di/injection.dart';
import 'package:medical_consultation_app/domain/api/network_bound_resource.dart';
import 'package:medical_consultation_app/domain/api/network_bount_state.dart';
import 'package:medical_consultation_app/domain/data/appointments/appointment.dart';
import 'package:medical_consultation_app/domain/data/home/doctor.dart';
import 'package:medical_consultation_app/resources/colors.dart';
import 'package:medical_consultation_app/resources/fonts.dart';
import 'package:medical_consultation_app/resources/text_styles.dart';

class TodayAppointmentsList extends StatefulWidget {
  const TodayAppointmentsList({super.key});

  @override
  State<TodayAppointmentsList> createState() => _TodayAppointmentsListState();
}

class _TodayAppointmentsListState extends State<TodayAppointmentsList> {
  final bool _opacityChangeOnDrag = false;
  final bool _cardScaleAnimation = false;
  final bool _reverseOrder = false;
  CardOrientation? _cardDismissOrientationValue;
  CardOrientation? _swipeOrientation;
  final int _dismissedValue = 150;
  final _radiusController = TextEditingController();
  final _dismissController = TextEditingController();
  final Radius _radius = const Radius.circular(16.0);
  final _positionFactorController = TextEditingController();
  final _scaleFactorController = TextEditingController();
  final double _positionFactorValue = 1.5;
  final double _scaleFactorValue = 1;
  final AppointmentsCubit _appointmentsCubit = instance();

  @override
  void initState() {
    super.initState();
    _dismissController.text = _dismissedValue.toString();
    _radiusController.text = _radius.x.toString();
    _positionFactorController.text = _positionFactorValue.toString();
    _scaleFactorController.text = _scaleFactorValue.toString();
    _appointmentsCubit.fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    List<Appointment> appointments = [];
    Appointment appointment = Appointment(
        id: 12,
        date: "10 Jan 2023",
        time: "10:20 AM",
        doctor: const Doctor(
          "Abhishek",
          "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
          "Kidney",
          1000,
          10,
          4.5,
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          29,
        ));
    appointments.add(appointment);
    appointments.add(appointment);
    appointments.add(appointment);
    appointments.add(appointment);

    return BlocProvider<AppointmentsCubit>.value(
      value: _appointmentsCubit,
      child: SizedBox(
        height: 280,
        child: Expanded(
          child: BlocBuilder<AppointmentsCubit, NetworkBoundState>(
            builder: (context, state) {
              if (state is NetworkBoundResourceState<List<Appointment>>) {
                Resource<List<Appointment>> resource = state.resource;
                // final List<Appointment> appointments = resource.data ?? List.empty();
                if (resource.isLoading) {
                  return const Center(child: Text("Loading"));
                } else if (resource.isSuccess) {

                }
                return CardStackWidget(
                  opacityChangeOnDrag: _opacityChangeOnDrag,
                  animateCardScale: _cardScaleAnimation,
                  dismissedCardDuration: Duration(milliseconds: _dismissedValue),
                  positionFactor: double.tryParse(_positionFactorController.text),
                  scaleFactor: double.tryParse(_scaleFactorController.text),
                  onCardTap: (model) => debugPrint('on card tap -> $model'),
                  cardList: _getAppointments(appointments),
                  alignment: Alignment.bottomCenter,
                  reverseOrder: _reverseOrder,
                  cardDismissOrientation: _cardDismissOrientationValue,
                  swipeOrientation: _swipeOrientation,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  List<CardModel> _getAppointments(List<Appointment> appointments) {
    final width = MediaQuery.of(context).size.width - 32;
    const height = 150.0;

    var list = <CardModel>[];
    for (int index = 0; index < appointments.length; index++) {
      list.add(
        CardModel(
          key: Key("$index"),
          backgroundColor: ApplicationColors.zeus,
          radius: _radius,
          shadowColor: Colors.black.withOpacity(0.2),
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          appointments[index].doctor.profileImage,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white.withOpacity(.55),
                        fixedSize: const Size(54, 54),
                        minimumSize: const Size(54, 54),
                        elevation: 0,
                      ),
                      child: const SizedBox(
                        height: 24,
                        width: 24,
                        child: Icon(
                          Icons.message_rounded,
                          color: ApplicationColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "dr, ${appointments[index].doctor.name}",
                      style: TextStyles.semiBold(
                          color: ApplicationColors.white,
                          fontSize: FontSize.s20),
                    ),
                    Text(
                      appointments[index].time,
                      style: TextStyles.semiBold(
                          color: ApplicationColors.white,
                          fontSize: FontSize.s20),
                    ),
                  ],
                ),
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${appointments[index].doctor.speciality} Specialist",
                      style: TextStyles.regular(
                        color: ApplicationColors.grey7.withOpacity(.65),
                        fontSize: FontSize.s18,
                      ),
                    ),
                    Text(
                      appointments[index].date,
                      style: TextStyles.regular(
                        color: ApplicationColors.grey7.withOpacity(.65),
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return list;
  }
}
