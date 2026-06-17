import SwiftUI

struct PeriodScrollStrip: View {
    @ObservedObject var gameState: GameState

    var body: some View {
        HStack(spacing: 16) {
            ForEach(1...4, id: \.self) { p in
                Button("P\(p)") {
                    gameState.period = p
                }
                .font(.headline.bold())
                .foregroundColor(gameState.period == p ? .black : Color(hex: "C9A84C"))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(gameState.period == p ? Color(hex: "C9A84C") : Color.white.opacity(0.1))
                .cornerRadius(8)
            }
            Button("OT") {
                gameState.period = 5
            }
            .font(.headline.bold())
            .foregroundColor(gameState.period == 5 ? .black : Color(hex: "C9A84C"))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(gameState.period == 5 ? Color(hex: "C9A84C") : Color.white.opacity(0.1))
            .cornerRadius(8)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}