import SwiftUI

struct PreGameLobbyView: View {
    @ObservedObject var router: NavigationRouter
    let selectedBot: ChessBot
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color(hex: "302E2B")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Header
                HStack {
                    Image("logochess")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 40)
                    
                    Spacer()
                    
                    Image(systemName: "person.2.fill")
                        .foregroundColor(.gray)
                        .padding(8)
                        .background(Color(white: 0.15))
                        .cornerRadius(6)
                }
                .padding()
                .background(Color(hex: "302E2B"))
                
                Spacer()
                
                // Opponent Section
                VStack(spacing: 20) {
                    Text("Opponent")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 12) {
                        Text("10:00")
                            .font(.system(size: 48, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                        
                        Text("\(selectedBot.name) (\(selectedBot.eloRating))")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 1)
                        .padding(.horizontal, 40)
                    
                    VStack(spacing: 12) {
                        Text("shahil33 (800)")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text("10:00")
                            .font(.system(size: 48, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                // Play Button
                Button(action: {
                    router.navigate(to: .activeGame(selectedBot))
                }) {
                    Text("Play")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 120)
                        .background(Color(hex: "81B64C"))
                        .clipShape(Circle())
                }
                .padding(.bottom, 40)
                
                Spacer()
                
                // Bottom Navigation
                HStack {
                    TabBarItem(icon: "plus.square.fill", title: "New Game", isSelected: selectedTab == 0)
                        .onTapGesture { selectedTab = 0 }
                    Spacer()
                    TabBarItem(icon: "gamecontroller.fill", title: "Games", isSelected: selectedTab == 1)
                        .onTapGesture { selectedTab = 1 }
                    Spacer()
                    TabBarItem(icon: "person.2.fill", title: "Players", isSelected: selectedTab == 2)
                        .onTapGesture { selectedTab = 2 }
                    Spacer()
                    TabBarItem(icon: "chart.bar.fill", title: "Stats", isSelected: selectedTab == 3)
                        .onTapGesture { selectedTab = 3 }
                    Spacer()
                    TabBarItem(icon: "line.3.horizontal", title: "More", isSelected: selectedTab == 4)
                        .onTapGesture { selectedTab = 4 }
                }
                .padding(.horizontal, 20)
                .frame(height: 60)
                .background(Color(hex: "302E2B"))
            }
        }
        .navigationBarHidden(true)
    }
}