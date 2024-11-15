import 'package:flutter/material.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/size_unit.dart';

Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

Widget buildSectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      content,
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
      ),
    ),
  );
}

Widget termsconditioncontent() {
  return Padding(
    padding: const EdgeInsets.all(SizeUnit.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle('Welcome to our Company!'),
        buildSectionContent(
          'These terms and conditions outline the rules and regulations for the use of Our Companys Website, located at Our Website.By accessing this website we assume you accept these terms and conditions. Do not continue to use Our Company if you do not agree to take all of the terms and conditions stated on this page.The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company’s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of india. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.',
        ),
        buildSectionTitle('Cookies'),
        buildSectionContent(
          'We employ the use of cookies. By accessing Our Company, you agreed to use cookies in agreement with the Our Companys Privacy Policy.Most interactive websites use cookies to let us retrieve the user’s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.',
        ),
        buildSectionTitle('You must not'),
        buildSectionContent(
          '1 Republish material from Our Company\n\n'
          '2 Sell, rent or sub-license material from Our Company\n\n'
          '3 Reproduce, duplicate or copy material from Our Company',
        ),
        buildSectionTitle('This Agreement shall begin on the date hereof.'),
        buildSectionContent(
          '* You are entitled to post the Comments on our website and have all necessary licenses and consents to do so\n\n'
          '* The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party\n\n'
          '* The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\n\n'
          '* The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity\n\n',
        ),
        buildSectionTitle('You warrant and represent that:'),
        buildSectionContent(
          'With ${AppStrings.appName}, shopping and service booking have never been easier or more local. Start discovering and connecting with your local stores or service providers today. Join us in building a better city, a better community, and a connection to the best the city has to offer.',
        ),
        buildSectionTitle('This Agreement shall begin on the date hereof.'),
        buildSectionContent(
            'This Agreement shall begin on the date hereof. Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Our Company does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Our Company,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Our Company shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website. Our Company reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.'),
      ],
    ),
  );
}
