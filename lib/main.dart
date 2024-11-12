//changed
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/firebase_options.dart';
import 'package:patient_journey_management/utilities/custom_bottom_navbar.dart';
import 'package:patient_journey_management/view/auth_view/forget_password/create_new_password.dart';
import 'package:patient_journey_management/view/auth_view/forget_password/forget_otp_verification.dart';
import 'package:patient_journey_management/view/auth_view/forget_password/forget_password.dart';
import 'package:patient_journey_management/view/auth_view/otp_verification.dart';
import 'package:patient_journey_management/view/auth_view/register_page.dart';
import 'package:patient_journey_management/view/book_an_appointment/selectClinic.dart';
import 'package:patient_journey_management/view/book_an_appointment/selectSpecialist.dart';
import 'package:patient_journey_management/view/my_consultations/appointment_status.dart';
import 'package:patient_journey_management/view/book_an_appointment/appointment_type.dart';
import 'package:patient_journey_management/view/my_bookings/appointmentpage.dart';
import 'package:patient_journey_management/view/my_consultations/cancelConsultation.dart';
import 'package:patient_journey_management/view/my_consultations/dr_info.dart';
import 'package:patient_journey_management/view/home_page/homepage.dart';
import 'package:patient_journey_management/view/auth_view/login_page.dart';
import 'package:patient_journey_management/view/my_consultations/myconsultations.dart';
import 'package:patient_journey_management/view/my_consultations/reportToDoct_Nurse.dart';
import 'package:patient_journey_management/view/my_consultations/rescheduleConsultation.dart';
import 'package:patient_journey_management/view/notifications/notificationpage.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_datetime.dart';
import 'package:patient_journey_management/view/book_an_appointment/select_hospital.dart';
import 'package:patient_journey_management/view/peerReview/peerReviewPage.dart';
import 'package:patient_journey_management/view/privacyPolicy.dart';
import 'package:patient_journey_management/view/secondOpinion/secondOpinionPage.dart';

import 'package:patient_journey_management/view/splash_view/splash.dart';
import 'package:patient_journey_management/view/splash_view/splash2.dart';
import 'package:patient_journey_management/view/teleMedicine/telemedicinePage.dart';
import 'package:patient_journey_management/view/termsAndCondition.dart';
import 'package:patient_journey_management/view/usInPatient/usInPatient.dart';

import 'controller/auth_controller/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // print(height);
    // print(width);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patient Journey Management',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: AppColors.blue50,
          cursorColor: AppColors.blue,
          selectionHandleColor: AppColors.blue,
        ),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
            color: AppColors.white, surfaceTintColor: AppColors.white),
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  Splash1()),
        GetPage(name: '/splash', page: () => const Splash2()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(
            name: '/customBottomNavBar',
            page: () => const CustomBottomNavigationBar()),
        GetPage(
            name: '/Notificationpage', page: () => const NotificationPage()),
        GetPage(name: '/AppointmentPage', page: () => const AppointmentPage()),
        GetPage(name: '/AppointmentType', page: () => const AppointmentType()),
        GetPage(name: '/AppointmentType', page: () => const SelectHospital()),
        GetPage(
            name: '/SelectDateAndTime', page: () => const SelectDateAndTime()),
        GetPage(
            name: '/CustomBottomNavigationBar',
            page: () => const CustomBottomNavigationBar()),
        GetPage(name: '/MyConsultations', page: () => const MyConsultations()),
        GetPage(name: '/DrInfo', page: () => const DrInfo()),
        GetPage(
            name: '/AppointmentStatus', page: () => const AppointmentStatus()),
        GetPage(name: '/LoginPage', page: () => LoginPage()),
        GetPage(name: '/RegisterPage', page: () => RegisterPage()),
        GetPage(name: '/OtpConfirmation', page: () => const OtpConfirmation()),
        GetPage(
            name: '/Forgetpasswordemail',
            page: () => const Forgetpasswordemail()),
        GetPage(
            name: '/Forgetpasswordotp', page: () => const Forgetpasswordotp()),
        GetPage(name: '/CreateNewPassword', page: () => CreateNewPassword()),
        GetPage(name: '/SecondOpinion', page: () => const SecondOpinion()),
        GetPage(name: '/PeerReview', page: () => const PeerReview()),
        GetPage(name: '/Usinpatient', page: () => Usinpatient()),
        GetPage(
            name: '/ReporttodoctNurse', page: () => const ReporttodoctNurse()),
        GetPage(
            name: '/TermsAndCondition', page: () => const TermsAndCondition()),
        GetPage(name: '/PrivacyPolicy', page: () => const PrivacyPolicy()),
        GetPage(
            name: '/Cancelconsultation',
            page: () => const Cancelconsultation()),
        GetPage(
            name: '/RescheduleConsultation',
            page: () => const RescheduleConsultation()),
        GetPage(
            name: '/Telemedicinepage', page: () => const Telemedicinepage()),
        GetPage(name: '/SelectClinic', page: () => const SelectClinic()),
        GetPage(
            name: '/Selectspecialist', page: () => const Selectspecialist()),
        GetPage(name: '/SelectHospital', page: () => const SelectHospital()),
      ],
    );
  }
}
