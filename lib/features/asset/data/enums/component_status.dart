enum ComponentStatus {
  alert,
  operating;

  static ComponentStatus fromString(String value) {
    switch (value) {
      case 'alert':
        return ComponentStatus.alert;
      case 'operating':
        return ComponentStatus.operating;
      default:
        throw Exception('Invalid ComponentStatus');
    }
  }
}
