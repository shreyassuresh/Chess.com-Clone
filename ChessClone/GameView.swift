import SwiftUI

struct ChessGameView: View {
    @StateObject private var game = ChessGame()
    @State private var showingMenu = false
    
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
                    
                    Text("vs Friend")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: { showingMenu = true }) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                .padding()
                .background(Color(hex: "302E2B"))
                
                // Player info - Black
                HStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        Text("Player 2")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("1200")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text("10:00")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                // Chess board
                ChessBoardView(game: game)
                    .padding()
                
                // Player info - White
                HStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading) {
                        Text("You")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("1150")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Text("10:00")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(hex: "81B64C").opacity(0.8))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                // Game controls
                HStack(spacing: 15) {
                    Button("Resign") {
                        // Resign action
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(8)
                    
                    Button("Draw") {
                        // Draw offer
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(8)
                    
                    Spacer()
                    
                    Button("New Game") {
                        game.resetGame()
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color(hex: "81B64C"))
                    .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showingMenu) {
            GameMenuView(isPresented: $showingMenu)
        }
    }
}

struct GameMenuView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Game Menu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                
                VStack(spacing: 15) {
                    GameMenuButton(title: "Analysis", icon: "chart.line.uptrend.xyaxis") {
                        isPresented = false
                    }
                    
                    GameMenuButton(title: "Settings", icon: "gear") {
                        isPresented = false
                    }
                    
                    GameMenuButton(title: "Exit Game", icon: "xmark.circle") {
                        isPresented = false
                    }
                }
                .padding()
                
                Spacer()
            }
            .background(Color(hex: "302E2B"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct GameMenuButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 30)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding()
            .background(Color(white: 0.15))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
