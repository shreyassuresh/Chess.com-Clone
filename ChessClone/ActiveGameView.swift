import SwiftUI

struct ActiveGameView: View {
    @ObservedObject var router: NavigationRouter
    let selectedBot: ChessBot
    @StateObject private var game = ChessGame()
    @State private var showSettings = false
    @State private var gameTimer = "9:41"
    @State private var moves = ["1. e4", "1... e5", "2. Nf3", "2... Nc6", "3. Bb5"]
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header with timer
                HStack {
                    Text(gameTimer)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(selectedBot.name) (\(selectedBot.eloRating))")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color(hex: "302E2B"))
                
                // Move list
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(moves, id: \.self) { move in
                            Text(move)
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(6)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                
                // Chess board
                ChessBoardView(game: game)
                    .padding()
                
                Spacer()
                
                // Bottom toolbar
                HStack(spacing: 20) {
                    ToolbarButton(title: "Options") {
                        showSettings = true
                    }
                    
                    ToolbarButton(title: "New") {
                        game.resetGame()
                    }
                    
                    ToolbarButton(title: "Hint") {
                        // Show hint
                    }
                    
                    ToolbarButton(title: "Back") {
                        // Undo move
                    }
                    
                    ToolbarButton(title: "Forward") {
                        // Redo move
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showSettings) {
            GameSettingsSheet(isPresented: $showSettings)
        }
        .onAppear {
            // Simulate game ending after 10 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                let result = GameResult(
                    winner: selectedBot.name,
                    playerRating: 800,
                    opponentRating: selectedBot.eloRating,
                    moves: moves,
                    opponentMessage: "I got you this time! Should we play another one?"
                )
                router.navigate(to: .gameResult(result))
            }
        }
    }
}

struct ToolbarButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.3))
                .cornerRadius(8)
        }
    }
}