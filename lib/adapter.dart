import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Myimage.dart';
import 'package:pas1_mobile_11pplg2_08_caesar/widget/Mytext.dart';
import 'model/post_model.dart';


class AdapterLiga extends StatelessWidget {
  final PostModel post;
  final VoidCallback onTap;
  final VoidCallback? onFavorite;

  const AdapterLiga({
    Key? key,
    required this.post,
    required this.onTap,
    this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              MyImage(
                imageName: post.strBadge,
                width: 50,
                height: 50,
                borderRadius: 8,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      hintText: post.strTeam,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      colors: Colors.black,
                    ),
                    const SizedBox(height: 4),
                    MyText(
                      hintText: post.strTeamShort != null && post.strTeamShort!.isNotEmpty
                          ? 'Short Name: ${post.strTeamShort}'
                          : 'Short Name: Not available',
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      colors: post.strTeamShort != null && post.strTeamShort!.isNotEmpty
                          ? const Color.fromARGB(255, 0, 0, 0)
                          : Colors.black,
                    ),
                    const SizedBox(height: 4),
                    MyText(
                      hintText: post.strStadium,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      colors: Colors.black,
                    ),
                  ],
                ),
              ),
              if (onFavorite != null)
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: onFavorite,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

