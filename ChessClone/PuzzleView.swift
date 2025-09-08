import SwiftUI

struct PuzzleView: View {
    @StateObject private var game = ChessGame()
    @State private var puzzleRating = 1200
    @State private var puzzleNumber = 1
    @State private var showHint = false
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Daily Puzzle")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("Rating: \(puzzleRating)")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                .padding()
                .background(Color(hex: "302E2B"))
                
                // Puzzle info
                VStack(spacing: 8) {
                    Text("White to move")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Find the best move for White")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.vertical, 10)
                
                // Chess board
                ChessBoardView(game: game)
                    .padding()
                
                // Puzzle controls
                VStack(spacing: 15) {
                    HStack(spacing: 20) {
                        Button(action: { showHint = true }) {
                            HStack {
                                Image(systemName: "lightbulb")
                                Text("Hint")
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.orange.opacity(0.8))
                            .cornerRadius(8)
                        }
                        
                        Button("Reset") {
                            game.resetGame()
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(8)
                        
                        Button("Solution") {
                            // Show solution
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(hex: "81B64C"))
                        .cornerRadius(8)
                    }
                    
                    // Progress indicator
                    HStack {
                        Text("Puzzle \(puzzleNumber) of 5")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            ForEach(1...5, id: \.self) { index in
                                Circle()
                                    .fill(index <= puzzleNumber ? Color(hex: "81B64C") : Color.gray.opacity(0.3))
                                    .frame(width: 8, height: 8)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .alert("Hint", isPresented: $showHint) {
            Button("OK") { }
        } message: {
            Text("Look for a tactical move that wins material!")
        }
    }
}