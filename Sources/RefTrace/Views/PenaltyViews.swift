import SwiftUI

struct PenaltyView: View {
    @ObservedObject var gameState: GameState
    @State var selectedType = "YEL"
    @State var selectedTeam = ""
    @State var playerNumber = ""
    @State var showConfirmation = false

    let penaltyTypes = ["YEL", "RED", "TEC", "FLG", "EJC"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Log Penalty")
                .font(.headline.bold())
                .foregroundColor(Color(hex: "C9A84C"))

            HStack {
                ForEach(penaltyTypes, id: \.self) { type in
                    Button(type) {
                        selectedType = type
                    }
                    .font(.caption.bold())
                    .foregroundColor(selectedType == type ? .black : .white)
                    .padding(8)
                    .background(selectedType == type ? Color(hex: "C9A84C") : Color.white.opacity(0.1))
                    .cornerRadius(8)
                }
            }

            HStack {
                Button(gameState.homeTeam) {
                    selectedTeam = gameState.homeTeam
                }
                .foregroundColor(selectedTeam == gameState.homeTeam ? .black : .white)
                .padding()
                .background(selectedTeam == gameState.homeTeam ? Color(hex: "C9A84C") : Color.white.opacity(0.1))
                .cornerRadius(10)

                Button(gameState.awayTeam) {
                    selectedTeam = gameState.awayTeam
                }
                .foregroundColor(selectedTeam == gameState.awayTeam ? .black : .white)
                .padding()
                .background(selectedTeam == gameState.awayTeam ? Color(hex: "C9A84C") : Color.white.opacity(0.1))
                .cornerRadius(10)
            }

            TextField("Player Number", text: $playerNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            Button("Log Penalty") {
                let p = Penalty(type: selectedType, team: selectedTeam, playerNumber: playerNumber, period: gameState.period)
                gameState.penalties.append(p)
                playerNumber = ""
                showConfirmation = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    showConfirmation = false
                }
            }
            .font(.headline)
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(hex: "C9A84C"))
            .cornerRadius(12)

            if showConfirmation {
                Text("Penalty Logged: \(selectedType) - \(selectedTeam) #\(playerNumber)")
                    .foregroundColor(.green)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}