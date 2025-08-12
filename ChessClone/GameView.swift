import SwiftUI

struct GameView: View {
    @StateObject private var game = ChessGame()
    @State private var showingMenu = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Game status
                HStack {
                    Text(game.gameStatus)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    // Current player indicator
                    Circle()
                        .fill(game.currentPlayer == .white ? Color.white : Color.black)
                        .stroke(Color.gray, lineWidth: 2)
                        .frame(width: 20, height: 20)
                }
                .padding(.horizontal)
                
                // Chess board
                ChessBoardView(game: game)
                    .padding()
                
                // Game controls
                HStack(spacing: 20) {
                    Button("New Game") {
                        game.resetGame()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Menu") {
                        showingMenu = true
                    }
                    .buttonStyle(.bordered)
                }
                
                Spacer()
            }
            .navigationTitle("Chess")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingMenu) {
                MenuView(isPresented: $showingMenu)
            }
        }
    }
}

struct MenuView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("logochess")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                    .padding()
                
                Text("Chess Clone")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(spacing: 15) {
                    MenuButton(title: "Play vs Friend", icon: "person.2.fill") {
                        isPresented = false
                    }
                    
                    MenuButton(title: "Play vs Computer", icon: "cpu.fill") {
                        // TODO: Implement AI
                        isPresented = false
                    }
                    
                    MenuButton(title: "Puzzles", icon: "puzzlepiece.fill") {
                        // TODO: Implement puzzles
                    }
                    
                    MenuButton(title: "Settings", icon: "gear.fill") {
                        // TODO: Implement settings
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        isPresented = false
                    }
                }
            }
        }
    }
}

struct MenuButton: View {
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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}