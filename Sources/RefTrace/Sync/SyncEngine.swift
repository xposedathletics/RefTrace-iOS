import Foundation
import Combine
 
// ── Sync engine -- bridges game state to other devices via localStorage polling
// In production: replace with URLSession WebSocket or Supabase Realtime
class SyncEngine: ObservableObject {
    @Published var connected: Bool = false
    let flagPublisher = PassthroughSubject<FlagEvent,Never>()
 
    func connect(sessionCode:String) {
        connected = true
        // TODO: Open WebSocket to wss://your-server.com/reftrace/\(sessionCode)
        // On message: decode JSON → update GameState fields
        // For local same-device testing: poll UserDefaults every 500ms
    }
 
    func disconnect() { connected = false }
 
    // Called by Head Ref after commitFlag
    func broadcastFlag(_ flag: FlagEvent) {
        // Encode flag to JSON and send via WebSocket or UserDefaults
        if let data = try? JSONEncoder().encode(flag) {
            UserDefaults.standard.set(data, forKey:"reftrace_penalty_flag")
        }
        flagPublisher.send(flag)
    }
}
