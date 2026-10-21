import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _email;
import 'package:rive/rive.dart';
import 'dart:async';//3.1 Importar el timer 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Control para mostrar/ocultar contraseña
  bool _isObscure = true;

  StateMachineController? _controller;
  SMIBool? _isChecking;
  SMIBool? _isHandsUp;
  SMITrigger? _trigSuccess;
  SMITrigger? _trigFail;
  SMINumber? _numLook;

  //3.2 Timer para detener la mirada al dejar de escribir
  Timer? _typingDebounce;

//2.1 Crear variables para el focusNode
final _emailFocusNode = FocusNode();
final _passwordFocusNode = FocusNode();

//2.2 Crear los listeners (Oyentes/Chismosos)
void initState() {
  super.initState();

  _emailFocusNode.addListener(() {
//Verificar que no sea nulo.
  if (_emailFocusNode.hasFocus) {
    if (_isHandsUp != null) {
      //Ojos sin cerrar
      _isHandsUp!.change(false);
      _numLook?.value= 50; //mirada neutral 
    }
  }
});
_passwordFocusNode.addListener(() {
  //manos arriba en password
  _isHandsUp?.change(_passwordFocusNode.hasFocus);
});
}

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: 200,
                  child: RiveAnimation.asset(
                    "assets/login-bear-animation.riv",
                    onInit: (artboard) {
                      _controller = StateMachineController.fromArtboard(
                        artboard,
                        'Login Machine',
                      );
                      if (_controller == null) return;

                      artboard.addController(_controller!);

                      _isChecking = _controller!.findSMI('isChecking');
                      _isHandsUp = _controller!.findSMI('isHandsUp');
                      _trigSuccess = _controller!.findSMI('trigSuccess');
                      _trigFail = _controller!.findSMI('trigFail');
                      _numLook = _controller!.findSMI('numLook');
                    },
                  ),
                ), //SizedBox
                const SizedBox(height: 10),
                TextField(
                  focusNode: _emailFocusNode,
                  onChanged: (value) {
                    if (_isHandsUp != null) {
                      // No tapes los ojos
                      // _isHandsUp!.change(false);
                    }
                    if (_isChecking == null) return;
                    _isChecking!.change(true);
                    //3.4 Implementar el numLook
                    //Ajustes del 0 al 100
                    // 80 es medida de la calibracion, Clamp es el rango (abrazadera)
                    final look = (value.length / 80 * 100).clamp(0.0, 100.0);
                    _numLook?.value = look;
                    //3.5 debounce: si vuelve a teclear, reinicia el contador 
                    _typingDebounce?.cancel(); //cancelamos cualquier timer que este corriendo
                    _typingDebounce = Timer(const Duration(milliseconds: 3), () {
                      //si se cierra la pantalla (!mounted) 
                      if (!mounted) return;
                      _isChecking?.change(false);
                      });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email@ejemplo.com",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  focusNode: _passwordFocusNode,
                  onChanged: (value) {
                    if (_isChecking != null) {
                      // No tapes los ojos
                      // _isChecking!.change(false);
                    }
                    if (_isHandsUp == null) return;
                    _isHandsUp!.change(true);
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    @override
  void dispose() {
    //2.4 Liberar memoria de los focusNode
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    //3.5 Liberar Timer
    _typingDebounce?.cancel();
    super.dispose();
  }
}
}