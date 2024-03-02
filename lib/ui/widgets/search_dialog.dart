import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/ui/widgets/button_widget.dart';
import 'package:mobigic_test/utils/app_constants.dart';

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter a word to search",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14.0,
                  ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: searchTextEditingController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a word';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(AppConstants.nameRegExp),
              ],
              cursorColor: Theme.of(context).primaryColor,
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: InputDecoration(
                label: const Text('Search words'),
                hintText: "Search words",
                filled: true,
                fillColor: AppConstants.signinBackground,
                focusColor: AppConstants.signinBackgroundActive,
                hintStyle: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: "Regular",
                  fontSize: 16.0.sp,
                ),
                contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              type: ButtonType.primary,
              onTap: () {
                if (searchTextEditingController.text.isNotEmpty) {
                  Get.back(result: searchTextEditingController.text);
                }
              },
              title: "Search",
            ),
          ],
        ),
      ),
    );
  }
}
