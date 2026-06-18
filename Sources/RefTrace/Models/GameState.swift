import Foundation
import Combine

class GameState: ObservableObject {
    @Published var homeTeam: String = "Home"
    @Published var awayTeam: String = "Away"
    @Published var homeScore: Int = 0
    @Published var awayScore: Int = 0
    @Published var period: Int = 1
    @Published var clockRunning: Bool = false
    @Published var clockSeconds: Int = 720
    @Published var penalties: [Penalty] = []
    @Published var sessionCode: String = ""
    @Published var userRole: String = "head"

    func incrementHome() { homeScore += 1 }
    func incrementAway() { awayScore += 1 }
    func decrementHome() { if homeScore > 0 { homeScore -= 1 } }
    func decrementAway() { if awayScore > 0 { awayScore -= 1 } }
    func nextPeriod() { period += 1 }

    func resetClock(minutes: Int) {
        clockSeconds = minutes * 60
        clockRunning = false
    }
}

struct Penalty: Identifiable {
    var id = UUID()
    var type: String
    var team: String
    var playerNumber: String
    var period: Int
    var timestamp: Date = Date()
}
