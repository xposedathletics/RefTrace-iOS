import Foundation
import Combine

public class SyncEngine: ObservableObject {
    
    public static let shared = SyncEngine()
    
    @Published public var isConnected: Bool = false
    @Published public var lastSyncTime: Date? = nil
    @Published public var sessionCode: String = ""
    
    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        setupSync()
    }
    
    private func setupSync() {
        isConnected = true
    }
    
    public func startSession(code: String) {
        sessionCode = code
        isConnected = true
        lastSyncTime = Date()
        startPolling()
    }
    
    public func stopSession() {
        isConnected = false
        stopPolling()
        sessionCode = ""
    }
    
    public func syncNow() {
        lastSyncTime = Date()
    }
    
    private func startPolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.syncNow()
        }
    }
    
    private func stopPolling() {
        timer?.invalidate()
        timer = nil
    }
    
    public func generateSessionCode() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<6).map { _ in letters.randomElement()! })
    }
}