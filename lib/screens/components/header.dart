import 'package:admin_panel_flutter/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Dashboard",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/profile_pic.png',
            height: 38,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Angellina Jolie"),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search Here",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            padding: const EdgeInsets.all(defaultPadding * .75),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
        ),
      ),
    );
  }
}
