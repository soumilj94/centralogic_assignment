import 'package:centralogic_assignment/features/blocs/login_page/login_bloc.dart';
import 'package:centralogic_assignment/features/blocs/login_page/login_event.dart';
import 'package:centralogic_assignment/features/blocs/login_page/login_state.dart';
import 'package:centralogic_assignment/features/pages/home_page.dart';
import 'package:centralogic_assignment/features/pages/register_page.dart';
import 'package:centralogic_assignment/features/widgets/custom_divider.dart';
import 'package:centralogic_assignment/features/widgets/custom_signin_button.dart';
import 'package:centralogic_assignment/features/widgets/custom_texts.dart';
import 'package:centralogic_assignment/features/widgets/input_field_label.dart';
import 'package:centralogic_assignment/features/widgets/register_login_text_identifier.dart';
import 'package:centralogic_assignment/features/widgets/rounded_button.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(backgroundColor: AppColors.white),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state.isAuthenticated){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false
              );
            }
            else if(state.loginError != null){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(
                  state.loginError!,
                ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state){
              final bloc = context.read<LoginBloc>();
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegisterTitleText(text: "Welcome Back 👋"),
                            Text("Sign to your account", style: TextStyle(color: AppColors.greyOne, fontSize: 16)),
                          ],
                        ),

                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [

                          // email
                          InputFieldLabel(text: "Email"),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Your email",
                              hintStyle: TextStyle(color: AppColors.greyOne),
                            ),
                              onChanged: (value) => bloc.add(EmailChanged(value)),
                          ),

                          SizedBox(height: 10),

                          // password
                          InputFieldLabel(text: "Password"),
                          TextFormField(
                            obscureText: !state.isPasswordVisible,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyTwo,
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: "Your password",
                              hintStyle: TextStyle(color: AppColors.greyOne),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  context.read<LoginBloc>().add(TogglePasswordVisibility());
                                },
                                icon: Icon(
                                  state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: AppColors.greyOne,
                                ),
                              ),
                            ),
                            onChanged: (value) => context.read<LoginBloc>().add(PasswordChanged(value)),
                          ),

                          // remember me checkbox
                          Row(
                            children: [
                              Checkbox(
                                value: state.rememberMe,
                                onChanged: (value) => bloc.add(RememberUserToggled(value!)),
                                activeColor: AppColors.primary,
                              ),
                              Text("Remember Me", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primary),)
                            ],
                          ),

                          RoundedButton(
                            onPressed: (){
                              bloc.add(SubmitLogin());
                            },
                            bgColor: AppColors.primary,
                            textColor: AppColors.white,
                            text: "Login",
                          ),

                          IdentifierPage(title: "Don't have an account?", action: "Register", nextPage: RegisterPage()),
                          // divider
                          CustomDivider(),

                          SizedBox(height: 15),
                          // sign in with buttons
                          CustomSigninButton(iconPath: "assets/google_icon.svg", text: "Sign in with Google"),
                          SizedBox(height: 2),
                          CustomSigninButton(iconPath: "assets/apple_icon.svg", text: "Sign in with Apple"),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
),
      ),
    );
  }
}