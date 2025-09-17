import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formatters {
  static final MaskTextInputFormatter phoneNumber = MaskTextInputFormatter(
    mask: '+971-##-#######',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static final MaskTextInputFormatter code = MaskTextInputFormatter(
    mask: '# # # # # #',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter creditCard = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static final MaskTextInputFormatter expiryDate = MaskTextInputFormatter(
    mask: '##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static final MaskTextInputFormatter cvv = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
