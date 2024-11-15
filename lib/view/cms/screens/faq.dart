import 'package:bellaryapp/common/widgets/appbars/appbar_common.dart';
import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/view/cms/widget/appbar_extended.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/size_unit.dart';
import '../../../providers/faq_provider.dart';
import '../../../theme/palette.dart';

class FAQscreen extends StatelessWidget {
  const FAQscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqProvider = Provider.of<FAQProvider>(context);

    return CustomScaffold(
      appBar: const AppBarCommon(
        title: "About Us",
        backgroundColor: Palette.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Appbarcontainer(),
            Container(
              padding: const EdgeInsets.all(SizeUnit.lg),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: faqProvider.faqItems.length,
              padding: const EdgeInsets.all(SizeUnit.lg),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final faqItem = faqProvider.faqItems[index];
                return ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: const EdgeInsets.all(8.0),
                  expansionCallback: (panelIndex, isExpanded) {
                    faqProvider.toggleFAQItem(index);
                  },
                  children: [
                    ExpansionPanel(
                      isExpanded: faqItem.isExpanded,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(faqItem.question),
                        );
                      },
                      body: ListTile(
                        title: Text(faqItem.answer),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
