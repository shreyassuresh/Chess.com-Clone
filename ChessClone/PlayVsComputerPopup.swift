import SwiftUI

struct PlayVsComputerPopup: View {
    @Binding var isPresented: Bool
    
    @State private var selectedColor: PlayerColor = .white
    @State private var selectedMode: GameMode = .friendly
    
    enum PlayerColor: String, CaseIterable {
        case white = "White"
        case random = "Random"
        case black = "Black"
        
        var icon: String {
            switch self {
            case .white: return "♔"
            case .random: return "A"
            case .black: return "♚"
            }
        }
    }
    
    enum GameMode: String, CaseIterable {
        case challenge = "Challenge"
        case friendly = "Friendly"
        case assisted = "Assisted"
        case custom = "Custom"
            
        
        var description: String {
            switch self {
            case .challenge: return "No help of any kind"
            case .friendly: return "Hints & takebacks allowed"
            case .assisted: return "All the tools available"
            case .custom: return "Choose the settings you want"
                    
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(spacing: 10) {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 10)
                }
                
                Text("Play vs...")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                VStack {
                    Image("Screenshot 2025-08-19 at 13.47.20")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    HStack(spacing: 4) {
                        Text("Sven")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text("(1100)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Image(systemName: "flag.fill")
                            .foregroundColor(.red)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("I PLAY AS")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 12) {
                        ForEach(PlayerColor.allCases, id: \.self) { color in
                            Button(action: {
                                selectedColor = color
                            }) {
                                Text(color.icon)
                                    .font(.largeTitle)
                                    .frame(width: 60, height: 60)
                                    .background(selectedColor == color ? Color(hex: "81B64C").opacity(50) : Color.gray.opacity(0.3))
                                    .foregroundColor(selectedColor == color ? .white : .black)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("MODE")
                        .font(.headline)
                        .foregroundColor(.white)
                        
                    
                    ForEach(GameMode.allCases,  id: \.self) { mode in
                        Button(action: {
                            selectedMode = mode
                            
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(mode.rawValue)
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(mode.description)
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                HStack(spacing: 2) {
                                    ForEach(0..<3) { _ in
                                        Image(systemName: "crown.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                            .padding()
                            .background(selectedMode == mode ? Color(hex: "81B64C").opacity(50) : Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
                
                NavigationLink(destination: ChessGameView()) {
                    Text("Play")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "81B64C"))
                        .cornerRadius(16)
                }
            }
            .padding()
            .background(Color(hex: "302E2B"))
            .cornerRadius(20)
            .padding(.horizontal, 30)
            .shadow(radius: 20)
        }
    }
}