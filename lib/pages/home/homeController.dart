class HomeController {
  String funcNavigation(int index) {
    if (index == 0) {
      return "/home/lancamentos";
    } else if (index == 1) {
      return "/home/dashboard";
    }
  }
}
