import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient_journey_management/constants/colors.dart';
import 'package:patient_journey_management/utilities/custom_widgets/button.dart';
import '../../controller/hospitalController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectHospital extends StatelessWidget {
  const SelectHospital({super.key});

  @override
  Widget build(BuildContext context) {
    final HospitalController controller = Get.put(HospitalController());
    TextEditingController searchController = TextEditingController();

    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          color: AppColors.blue6.withOpacity(0.1),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 326,
              height: 310,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  // Dropdown for Hospital Selection
                  Obx(() {
                    // Filter hospitals based on search input
                    List<String> filteredHospitals = controller.hospitals
                        .where((hospital) => hospital
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .toList();

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white4,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Hospital',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: filteredHospitals
                              .map((hospital) => DropdownMenuItem<String>(
                                    value: hospital,
                                    child: Text(
                                      hospital,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: controller.selectedHospital.value.isEmpty
                              ? null
                              : controller.selectedHospital.value,
                          onChanged: (value) {
                            controller.selectedHospital.value = value ?? '';
                            controller.selectedSpecialty.value =
                                ''; // Reset specialty
                            controller.selectedDoctor.value =
                                ''; // Reset doctor
                            searchController.clear(); // Clear the search field
                          },
                          buttonStyleData: const ButtonStyleData(
                            height: 45,
                            padding: EdgeInsets.only(right: 10),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            maxHeight: 275,
                          ),
                          // Include a search bar
                          dropdownSearchData: DropdownSearchData(
                            searchController: searchController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                controller: searchController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Search Hospital',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  focusedBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onChanged: (value) {
                                  // Trigger UI update to filter hospitals
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  // Dropdown for Specialty Selection
                  Obx(() => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white4,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Specialty',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: controller
                                .getSpecialties(
                                    controller.selectedHospital.value)
                                .map((specialty) => DropdownMenuItem<String>(
                                      value: specialty,
                                      child: Text(
                                        specialty,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: controller.selectedSpecialty.value.isEmpty
                                ? null
                                : controller.selectedSpecialty.value,
                            onChanged: (value) {
                              controller.selectedSpecialty.value = value ?? '';
                              controller.selectedDoctor.value =
                                  ''; // Reset doctor
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 45,
                              padding: EdgeInsets.only(right: 10),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              maxHeight: 275,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(height: 20),

                  // Dropdown for Doctor Selection
                  Obx(() => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white4,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Doctor',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: controller
                                .getDoctors(
                                  controller.selectedHospital.value,
                                  controller.selectedSpecialty.value,
                                )
                                .map((doctor) => DropdownMenuItem<String>(
                                      value: doctor,
                                      child: Text(
                                        doctor,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: controller.selectedDoctor.value.isEmpty
                                ? null
                                : controller.selectedDoctor.value,
                            onChanged: (value) {
                              controller.selectedDoctor.value = value ?? '';
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 45,
                              padding: EdgeInsets.only(right: 10),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              maxHeight: 275,
                            ),
                          ),
                        ),
                      )),
                  const Spacer(),

                  // Continue button, enabled only if all fields are selected
                  Obx(() {
                    bool isEnabled = controller.selectedHospital.isNotEmpty &&
                        controller.selectedSpecialty.isNotEmpty &&
                        controller.selectedDoctor.isNotEmpty;

                    return GestureDetector(
                      onTap: isEnabled
                          ? () {
                              Get.toNamed('/SelectDateAndTime');
                            }
                          : null,
                      child: isEnabled
                          ? const ButtonCustom(
                              name: 'Continue',
                              height: 48,
                              width: 280,
                            )
                          : const Text(''),
                    );
                  }),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
