import 'package:get/get.dart';

class HospitalController extends GetxController {
  // Map structure for hospitals, specialties, and doctors
  final Map<String, Map<String, List<String>>> hospitalData = {
    'Hospital A': {
      'Cardiology': ['Dr. A1', 'Dr. A2'],
      'Dermatology': ['Dr. A3', 'Dr. A4'],
    },
    'Hospital B': {
      'Neurology': ['Dr. B1', 'Dr. B2'],
      'Pediatrics': ['Dr. B3', 'Dr. B4'],
    },
    // Add more hospitals as needed
  };

  // Observable properties to track selections
  var selectedHospital = ''.obs;
  var selectedSpecialty = ''.obs;
  var selectedDoctor = ''.obs;

  // Get a list of hospitals
  List<String> get hospitals => hospitalData.keys.toList();

  // Get specialties for a selected hospital
  List<String> getSpecialties(String hospitalName) {
    return hospitalData[hospitalName]?.keys.toList() ?? [];
  }

  // Get doctors for a selected specialty
  List<String> getDoctors(String hospitalName, String specialtyName) {
    return hospitalData[hospitalName]?[specialtyName] ?? [];
  }
}
