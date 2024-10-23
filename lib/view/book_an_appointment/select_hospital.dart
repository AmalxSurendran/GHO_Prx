import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              width: 326.w,
              height: 310.h,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.all(10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),

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
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Hospital',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: filteredHospitals
                              .map((hospital) => DropdownMenuItem<String>(
                                    value: hospital,
                                    child: Text(
                                      hospital,
                                      style: TextStyle(
                                        fontSize: 14.sp,
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
                          buttonStyleData: ButtonStyleData(
                            height: 45.h,
                            padding: EdgeInsets.only(right: 10.w),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            maxHeight: 275.h,
                          ),
                          // Include a search bar
                          dropdownSearchData: DropdownSearchData(
                            searchController: searchController,
                            searchInnerWidgetHeight: 50.h,
                            searchInnerWidget: Container(
                              height: 50.h,
                              padding: EdgeInsets.only(
                                top: 8.h,
                                bottom: 4.h,
                                right: 8.w,
                                left: 8.w,
                              ),
                              child: TextFormField(
                                cursorColor: Theme.of(context).primaryColor,
                                controller: searchController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 8.h,
                                  ),
                                  hintText: 'Search Hospital',
                                  hintStyle: TextStyle(fontSize: 12.sp),
                                  focusedBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.r),
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

                  SizedBox(height: 20.h),

                  // Dropdown for Specialty Selection
                  Obx(() => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white4,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select Specialty',
                              style: TextStyle(
                                fontSize: 14.sp,
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
                                        style: TextStyle(
                                          fontSize: 14.sp,
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
                            buttonStyleData: ButtonStyleData(
                              height: 45.h,
                              padding: EdgeInsets.only(right: 10.w),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              maxHeight: 275.h,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.h),

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
                                fontSize: 14.sp,
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
                                        style: TextStyle(
                                          fontSize: 14.sp,
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
                            buttonStyleData: ButtonStyleData(
                              height: 45.h,
                              padding: EdgeInsets.only(right: 10.w),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              maxHeight: 275.h,
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
                          ? ButtonCustom(
                              name: 'Continue',
                              height: 48.h,
                              width: 280.w,
                            )
                          : const Text(''),
                    );
                  }),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
