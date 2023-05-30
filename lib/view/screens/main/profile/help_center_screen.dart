import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/default_app_bar.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/default_text_form_field.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: DefaultAppBar(
            leading: BackButton(color: AppColors.neutral),
            centerTitle: true,
            title: DefaultText(
              text: AppStrings.helpCenter,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          preferredSize: Size.fromHeight(50)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            DefaultFormField(
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColors.neutral,
                size: 25,
              ),
              inputBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.neutral),
                  borderRadius: BorderRadius.circular(25)),
              hintText: AppStrings.whatCanWeHelp,
              controller: searchController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColors.neutral, width: .25)),
                        child: ExpansionTile(
                          textColor: Colors.black,
                          title: Text('Lorem ipsum dolor sit amet'),
                          children: <Widget>[
                            ListTile(
                                title: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.')),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2.h,
                      ),
                  itemCount: 5),
            )
          ],
        ),
      ),
    );
  }
}
