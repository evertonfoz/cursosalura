import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leonan/drawer/widgets/container_iluminado_widget.dart';
import 'package:leonan/local_persistence/daos/palavra_dao.dart';
import 'package:leonan/mixins/widgets_mixin.dart';
import 'package:leonan/models/palavra_model.dart';
import 'package:leonan/widgets/dialogs/success_dialog_widget.dart';
import 'package:leonan/widgets/raisedbutton_with_snackbar_widget.dart';

import 'crud/palavras_crud_form_bloc.dart';
import 'crud/palavras_crud_form_event.dart';
import 'crud/palavras_crud_form_state.dart';

class PalavrasCRUDRoute extends StatefulWidget {
  @override
  _PalavrasCRUDRouteState createState() => _PalavrasCRUDRouteState();
}

class _PalavrasCRUDRouteState extends State<PalavrasCRUDRoute>
    with TextFormFieldMixin {
  final _palavraController = TextEditingController();
  final _ajudaController = TextEditingController();
  final FocusNode _palavraFocus = FocusNode();
  final FocusNode _ajudaFocus = FocusNode();

  PalavrasCrudFormBloc _palavrasCrudFormBloc;
  BuildContext _buildContext;

  @override
  void initState() {
    super.initState();
    this._palavrasCrudFormBloc = BlocProvider.of<PalavrasCrudFormBloc>(context);
    this._palavraController.addListener(_onPalavraChanged);
    this._ajudaController.addListener(_onAjudaChanged);
  }

  @override
  void dispose() {
    this._palavraController.dispose();
    this._ajudaController.dispose();
    super.dispose();
  }

  void _onPalavraChanged() {
    _palavrasCrudFormBloc
        .add(PalavraChanged(palavra: this._palavraController.text));
  }

  void _onAjudaChanged() {
    _palavrasCrudFormBloc.add(AjudaChanged(ajuda: this._ajudaController.text));
  }

  @override
  Widget build(BuildContext context) {
    this._buildContext = context;
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text(
          'Registro de Palavras',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: _mainColumn(),
          ),
        ),
      ),
    );
  }

  Widget _form(PalavrasCrudFormState formState) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textFormField(
              focusNode: this._palavraFocus,
              controller: this._palavraController,
              labelText: 'Palavra',
              onFieldSubmitted: (_) => FocusScope.of(this._buildContext)
                  .requestFocus(this._ajudaFocus),
              textInputAction: TextInputAction.next,
              validator: (_) {
                return formState.aPalavraEhValida ? null : 'Informe a palavra';
              }),
          SizedBox(
            height: 20,
          ),
          textFormField(
              maxLines: 4,
              focusNode: this._ajudaFocus,
              controller: this._ajudaController,
              labelText: 'Ajuda',
              validator: (_) {
                return formState.aAjudaEhValida ? null : 'Informe a ajuda';
              }),
          SizedBox(
            height: 20,
          ),
          RaisedButtonWithSnackBarWidget(
            onPressedVisible: formState.isFormValid,
            buttonText: 'Gravar',
            successTextToSnackBar:
                'Os dados informados foram registrados com sucesso.',
            failtTextToSnackbar: 'Erro na inserção',
            onButtonPressed: _onSubmitPressed,
            onSnackBarClosed: _resetForm,
          ),
        ],
      ),
    );
  }

  void _onSubmitPressed() async {
    PalavraDAO palavraDAO = PalavraDAO();
    PalavraModel palavraModel = PalavraModel(
        palavra: this._palavraController.text,
        ajuda: this._ajudaController.text);
    try {
      await palavraDAO.insert(palavraModel: palavraModel);
      _palavrasCrudFormBloc.add(FormSuccessSubmitted());
    } catch (e) {
      rethrow;
    }
  }

  Widget _mainColumn() {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10,
            ),
            child: ContainerIluminadoWidget(
              backgroundColor: Colors.white,
              shadowColor: Colors.white70,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: BlocBuilder<PalavrasCrudFormBloc, PalavrasCrudFormState>(
                  builder: (context, formState) {
                    if (formState.formularioEnviadoComSucesso) {
                      Timer(Duration(seconds: 4), () {
                        _palavraController.clear();
                        _ajudaController.clear();
                        this._palavrasCrudFormBloc.add(FormReset());
                      });
                    }
//                    return _form(formState);

                    return SuccessDialogWidget(
                      onDismissed: () {
                        _palavraController.clear();
                        _ajudaController.clear();
                        this._palavrasCrudFormBloc.add(FormReset());
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

//   _successDialog() async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       child: InformationAlertDialogWidget(
//         title: 'Tudo certo',
//         message: 'Os dados informados foram registrados com sucesso.',
//         actions: <Widget>[
//           ActionsFlatButtonToAlertDialogWidget(
//             messageButton: 'OK',
//             isDefaultAction: true,
//           ),
//         ],
//       ),
//     );
//   }

  _resetForm() {
    _palavraController.clear();
    _ajudaController.clear();
    this._palavrasCrudFormBloc.add(FormReset());
  }

  _onPressedRaisedButton(BuildContext buildContext) async {
    String textToSnackBar = this.successTextToSnackBar;
    bool success = true;
    FocusScope.of(buildContext).unfocus();
    try {
      await this.onButtonPressed();
    } catch (e) {
      textToSnackBar = this.failTextToSnackBar + ': ' + e.toString();
      success = false;
    }

    Scaffold.of(buildContext)
        .showSnackBar(
          SnackBar(
            backgroundColor: (success) ? Colors.indigo : Colors.red,
            content: Text(
              textToSnackBar,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (success) ? 14 : 16,
              ),
            ),
            duration: Duration(seconds: (success) ? 3 : 5),
          ),
        )
        .closed
        .then((_) => (success) ? this.onStackBarClosed() : () {});
  }
}
