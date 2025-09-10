import SwiftUI

struct HomePageView: View {
    @StateObject private var router = NavigationRouter()
    @State private var selectedTab = 0
    @State private var showPlayVsComputerPopup = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
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
                                Button(action: {
                                    router.navigate(to: .playBots)
                                }) {
                                    ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.21-removebg-preview", title: "Play Bots") { }
                                }
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.35-removebg-preview", title: "vs Computer") {
                                    showPlayVsComputerPopup = true
                                }
                                NavigationLink(destination: ChessGameView()) {
                                    ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.48-removebg-preview", title: "Play a Friend") { }
                                }
                            }
                            VStack{
                                Image("chesscoardsamplepuzzle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height:180)
                                    .cornerRadius(6)
                                NavigationLink(destination: PuzzleView()) {
                                    Text("Solve Puzzle")
                                        .buttonStyle(PlainButtonStyle())
                                        .frame(width: 148)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        .padding()
                                        .background(Color(white: 0.15))
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Completed Games")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.horizontal)
                            Image("Screenshot 2025-08-13 at 14.14.44")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        VStack(spacing: 10) {
                            Text("Daily Puzzle")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                            Image("chesscoardsamplepuzzle")
                                .resizable()
                                .frame(width: 350, height: 350)
                                .cornerRadius(3)
                            
                            NavigationLink(destination: PuzzleView()) {
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
        .navigationBarHidden(true)
        .navigationDestination(for: NavigationDestination.self) { destination in
            switch destination {
            case .playBots:
                PlayBotsLandingView(router: router)
            case .botSelection:
                BotSelectionView(router: router)
            case .preGameLobby(let bot):
                PreGameLobbyView(router: router, selectedBot: bot)
            case .activeGame(let bot):
                ActiveGameView(router: router, selectedBot: bot)
            case .gameResult(let result):
                GameResultView(router: router, gameResult: result)
            }
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