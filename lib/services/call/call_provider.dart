/// Contract for an actual WebRTC/telephony provider. The app never presents a
/// connected call until the configured provider confirms a joined session.
abstract class CallProvider { Future<String> createRoom({required String callId,required List<String> participantIds}); Future<void> joinRoom(String providerRoomId); Future<void> leaveRoom(String providerRoomId); }
