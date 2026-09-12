enum UserRole { student, advisor, admin }
enum AccountStatus { active, pending, rejected, disabled, blocked }
enum ConsultationStatus { pending, accepted, rejected, active, completed, cancelled }
enum AppointmentStatus { available, booked, cancelled, completed }
enum MessageType { text, image, file, voice, system }
enum MessageStatus { sending, sent, delivered, read, failed }
enum CallStatus { ringing, accepted, rejected, missed, ended }

extension EnumValue on Enum {
  String get value => name;
}
