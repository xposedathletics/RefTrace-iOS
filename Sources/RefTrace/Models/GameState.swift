import Foundation

struct ScoreEvent: Identifiable, Codable {
    let id = UUID()
    let side: String
    let type: String
    let pts: Int
    let periodLabel: String
    let clock: String
    let wall: String
    let ts: Date
}

struct FlagEvent: Identifiable, Codable {
    let id = UUID()
    let code: String
    let label: String
    let side: String
    let team: String
    let teamName: String
    let mascot: String
    let playerNum: String
    let periodLabel: String
    let clock: String
    let wall: String
    let ts: Date
}

struct GamePeriod: Identifiable, Codable {
    let id = UUID()
    let label: String
    let maxSecs: Int
    var scores: [ScoreEvent] = []
}