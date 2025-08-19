import SwiftUI

struct HomePageView: View {
    @State private var selectedTab = 0
    @State private var showPlayVsComputerPopup = false
    
    var body: some View {
        ZStack {
            Color(red: 27/255, green: 27/255, blue: 27/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                HStack {
                    Image("logochess")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 60)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 26, height: 20)
                        .foregroundColor(.gray)
                        .padding(8)
                        .background(Color(white: 0.15))
                        .cornerRadius(6)
                        .padding(.trailing, 10)
                }
                .frame(height: 60)
                .background(Color(hex: "302E2B"))
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        HStack(spacing: 60) {
                            VStack(spacing: 4) {
                                HStack{
                                    Image("Screenshot_2025-08-13_at_11.09.37-removebg-preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    VStack{
                                        Text("Play")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        Text("0")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                            }
                            VStack(spacing: 4) {
                                HStack{
                                    Image("Screenshot_2025-08-13_at_11.09.50-removebg-preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    VStack{
                                        Text("Puzzles")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                        Text("446")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        
                        HStack{
                            VStack(spacing: 14) {
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.21-removebg-preview", title: "New Game") { }
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.35-removebg-preview", title: "vs Computer") {
                                    showPlayVsComputerPopup = true
                                }
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.48-removebg-preview", title: "Play a Friend") { }
                            }
                            VStack{
                                Image("chesscoardsamplepuzzle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height:180)
                                    .cornerRadius(6)
                                Button("Solve Puzzle") {}
                                    .buttonStyle(PlainButtonStyle())
                                    .frame(width: 148)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Spacer()
                            Image("chessboard_placeholder")
                                .resizable()
                                .frame(width: 150, height: 160)
                                .cornerRadius(8)
                                .padding(.trailing, 16)
                        }
                        .padding(.top, 12)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Completed Games")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.horizontal)
                            Image("Screenshot 2025-08-13 at 14.14.44")
                                .resizable()
                                .scaledToFit()
                        }
                        .padding(.top, -180)
                        
                        VStack(spacing: 10) {
                            Text("Daily Puzzle")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                            Image("chesscoardsamplepuzzle")
                                .resizable()
                                .frame(width: 350, height: 350)
                                .cornerRadius(3)
                            
                            Button(action: {}) {
                                Text("Play")
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(hex: "81B64C"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top, 16)
                        
                        Spacer(minLength: 20)
                    }
                }
                
                HStack {
                    TabBarItem(icon: "house.fill", title: "Home", isSelected: selectedTab == 0)
                        .onTapGesture { selectedTab = 0 }
                    Spacer()
                    TabBarItem(icon: "puzzlepiece.fill", title: "Puzzles", isSelected: selectedTab == 1)
                        .onTapGesture { selectedTab = 1 }
                    Spacer()
                    TabBarItem(icon: "graduationcap.fill", title: "Learn", isSelected: selectedTab == 2)
                        .onTapGesture { selectedTab = 2 }
                    Spacer()
                    TabBarItem(icon: "play.rectangle.fill", title: "Watch", isSelected: selectedTab == 3)
                        .onTapGesture { selectedTab = 3 }
                    Spacer()
                    TabBarItem(icon: "line.3.horizontal", title: "More", isSelected: selectedTab == 4)
                        .onTapGesture { selectedTab = 4 }
                }
                .padding(.horizontal, 20)
                .frame(height: 60)
                .background(Color(hex: "302E2B"))
            }
            
            if showPlayVsComputerPopup {
                PlayVsComputerPopup(isPresented: $showPlayVsComputerPopup)
                    .transition(.opacity)
                    .animation(.easeInOut, value: showPlayVsComputerPopup)
            }
        }
    }
}
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
                
                Button(action: {
                    print("Play tapped with color: \(selectedColor.rawValue), mode: \(selectedMode.rawValue)")
                    isPresented = false
                }) {
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


struct ChessMenuButton: View {
    let iconName: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(iconName)
                    .resizable()
                    .frame(width: 28, height: 28)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                Spacer()
            }
            .padding()
            .background(Color(white: 0.15))
            .frame(width:170)
            .cornerRadius(8)
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? Color(hex: "81B64C") : .gray)
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? Color(hex: "81B64C") : .gray)
        }
    }
}




struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .previewDevice("iPhone 14 Pro")
    }
}
