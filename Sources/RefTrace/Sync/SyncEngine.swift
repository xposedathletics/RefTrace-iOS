import Foundation

class SyncEngine {
	ObservableObject {
    static let shared = SyncEngine()
    public init() {}

    func syncScore(sessionCode: String, home: Int, away: Int, period: Int) {
        print("Syncing: Session \(sessionCode) | H:\(home) A:\(away) P:\(period)")
    }

    func logPenalty(penalty: Penalty, sessionCode: String) {
        print("Penalty logged: \(penalty.type) - \(penalty.team) #\(penalty.playerNumber)")
    }
}
