class HomeController {
  String funcNavigation(int index) {
    if (index == 0) {
      return "/home/lancamentos/listagem";
    } else if (index == 1) {
      return "/home/dashboard";
    }
  }
}
