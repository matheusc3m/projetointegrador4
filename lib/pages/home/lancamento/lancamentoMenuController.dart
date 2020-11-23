class LancamentosMenuController {
  String funcNavigation(int index) {
    if (index == 0) {
      return "/home/lancamentos/alcoolHidratado";
    } else if (index == 1) {
      return "/home/lancamentos/destilacao";
    } else
      return null;
  }
}
