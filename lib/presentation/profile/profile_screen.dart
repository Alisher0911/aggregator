import 'package:aggregator/blocs/auth/auth_bloc.dart';
import 'package:aggregator/consts/colors.dart';
import 'package:aggregator/cubits/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          "Профиль",
          style: GoogleFonts.manrope(
            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black)
          ),          
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, profileState) {
          if (profileState.profileStatus == ProfileStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (profileState.profileStatus == ProfileStatus.success) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 38),
                
                SvgPicture.asset(
                  "assets/profile/profile_image.svg",
                  height: 64,
                  width: 64,
                ),
            
                const SizedBox(height: 15),
            
                Column(
                  children: [
                    Text(
                      profileState.user.nickname,
                      style: GoogleFonts.manrope(
                        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600)
                      ),
                    ),
            
                    const SizedBox(height: 12),
            
                    Text(
                      profileState.user.email,
                      style: GoogleFonts.manrope(
                        textStyle: TextStyle(fontSize: 16, color: grayColor)
                      ),
                    )
                  ],
                ),
            
                const SizedBox(height: 27),
            
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LoggedOut());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(whiteColor),
                    foregroundColor: MaterialStateProperty.all(whiteColor),
                    overlayColor: MaterialStateProperty.all(whiteColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      )
                    )
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Выйти",
                        style: GoogleFonts.manrope(
                          textStyle: TextStyle(fontSize: 16, color: redColor)
                        ),
                      ),
                    ),
                  )
                ),
              ],
            );
          }
          else if (profileState.profileStatus == ProfileStatus.error) {
            return Center(
              child: Text(
                "Произошла ошибка",
                style: GoogleFonts.manrope(
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }
          return Container();
        },
        
      )
    );
  }
}