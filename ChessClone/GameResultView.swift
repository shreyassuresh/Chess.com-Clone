import SwiftUI

struct GameResultView: View {
    @ObservedObject var router: NavigationRouter
    let gameResult: GameResult
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                
                // Result banner
                Text("\(gameResult.winner) Won")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(hex: "81B64C"))
                    .cornerRadius(16)
                
                // Chess board graphic
                Image("chesscoardsamplepuzzle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(12)
                
                // Move list
                VStack(alignment: .leading, spacing: 8) {
                    Text("Game Moves:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(gameResult.moves, id: \.self) { move in
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
                }
                
                // Opponent message
                VStack(spacing: 8) {
                    Text("Opponent says:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(gameResult.opponentMessage)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Action buttons
                VStack(spacing: 16) {
                    Button(action: {
                        router.navigate(to: .activeGame(ChessBot(
                            name: gameResult.winner,
                            eloRating: gameResult.opponentRating,
                            description: "Rematch opponent",
                            tags: ["REMATCH"],
                            avatar: "robot"
                        )))
                    }) {
                        Text("Rematch")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "81B64C"))
                            .cornerRadius(12)
                    }
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            router.navigate(to: .botSelection)
                        }) {
                            Text("New Bot")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(12)
                        }
                        
                        Button(action: {
                            // Game review action
                        }) {
                            Text("Game Review")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}