import SwiftUI

struct HomePageView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color(red: 27/255, green: 27/255, blue: 27/255)
//            Color(hex: "302E2B")
//                .background(Color(hex: "302E2B"))
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
                // Keep it pinned to top, no scrolling
                
                // MARK: Scrollable Main Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // MARK: Stats Section
                        HStack(spacing: 60) {
                            VStack(spacing: 4) {
                                HStack{
                                    Image("Screenshot_2025-08-13_at_11.09.37-removebg-preview")
                                    //                                Image(systemName: "trophy.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                    //                                    .font(.system(size: 28))
                                    //                                    .foregroundColor(.orange)
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
                                    //                                Image(systemName: "puzzlepiece.fill")
                                    //                                    .font(.system(size: 28))
                                    //                                    .foregroundColor(.orange)
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
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.35-removebg-preview", title: "vs Computer") { }
                                ChessMenuButton(iconName: "Screenshot_2025-08-13_at_13.20.48-removebg-preview", title: "Play a Friend") { }
                            }
                            VStack{
                                Image("chesscoardsamplepuzzle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height:180)
                                    .cornerRadius(6)
                                Button("Solve Puzzle") {}
                                    
                                    .buttonStyle(PlainButtonStyle()) // optional if you want no extra styles
                                    .frame(width: 148)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding()
                                    .background(Color(white: 0.15))
                                    .cornerRadius(8)
                                
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        // MARK: Mini Chessboard
                        HStack {
                            Spacer()
                            Image("chessboard_placeholder")
                                .resizable()
                                .frame(width: 150, height: 160)
                                .cornerRadius(8)
                                .padding(.trailing, 16)
                        }
                        .padding(.top, 12)
                        
                        // MARK: Completed Games
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
                        
                        // MARK: Daily Puzzle
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
//                                    .background(Color(red: 0, green: 158/255, blue: 73/255))
                                    .background(Color(hex: "81B64C"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.top, 16)
                        
                        Spacer(minLength: 20) // padding below scroll content
                    }
                }
                
                // MARK: Bottom Tab Bar - Fixed
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
//                .background(Color(red: 27/255, green: 27/255, blue: 27/255))
                .background(Color(hex: "302E2B"))
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
//                    .renderingMode(.template) // optional if you want to tint the image white
                   /* .foregroundColor(.white)*/  // tint color for template images
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

struct Game: Identifiable {
    let id = UUID()
    let player1: String
    let result: String
    let moves: Int
}

let sampleGames = [
    Game(player1: "shahil23", result: "0", moves: 35),
    Game(player1: "shahil23", result: "1", moves: 30),
    Game(player1: "Cyragon", result: "1", moves: 8),
    Game(player1: "Cyragon", result: "0", moves: 23),
    Game(player1: "rizwarrior", result: "0", moves: 26),
]

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .previewDevice("iPhone 14 Pro")
    }
}
