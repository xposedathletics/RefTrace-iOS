import SwiftUI
 
@main
struct RefTraceApp: App {
    @StateObject private var gameState = GameState()
    @StateObject private var syncEngine = SyncEngine()
 
    var body: some Scene {
        WindowGroup {
            ContentRootView()
                .environmentObject(gameState)
                .environmentObject(syncEngine)
                .preferredColorScheme(.dark)
        }
    }
}
