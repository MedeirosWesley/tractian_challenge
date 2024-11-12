enum SensorType {
  energy,
  vibration;

  static SensorType fromString(String value) {
    switch (value) {
      case 'energy':
        return SensorType.energy;
      case 'vibration':
        return SensorType.vibration;
      default:
        throw Exception('Invalid SensorType');
    }
  }
}
