import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ddd/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (left) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                    content: left.map(
                  cancelledByUser: (_) => const Text("Cancelled"),
                  serverError: (_) => const Text("Server error"),
                  emailAlreadyInUse: (_) => const Text("Email already in use"),
                  invalidEmailAndPasswordCombination: (_) =>
                      const Text("Invalid email and password combination"),
                )),
              );
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ListView(
              children: <Widget>[
                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 130,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: "Email",
                  ),
                  autocorrect: false,
                  onChanged: (value) => context.bloc<SignInFormBloc>().add(
                        SignInFormEvent.emailChanged(
                          value,
                        ),
                      ),
                  validator: (_) => context
                      .bloc<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (left) => left.maybeMap(
                          invaliedEmail: (_) => "Invalid email",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    labelText: "Password",
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context.bloc<SignInFormBloc>().add(
                        SignInFormEvent.passwordChanged(
                          value,
                        ),
                      ),
                  validator: (_) =>
                      context.bloc<SignInFormBloc>().state.password.value.fold(
                            (left) => left.maybeMap(
                              shortPassword: (_) => "Short password",
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text(
                        "SIGN IN",
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text(
                        "REGISTER",
                      ),
                    )
                  ],
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    context.bloc<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                  },
                  child: const Text(
                    "SIGN IN WITH GOOGLE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
