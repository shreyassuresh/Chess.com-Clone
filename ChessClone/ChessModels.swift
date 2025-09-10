import Foundation

struct ChessBot {
    let name: String
    let eloRating: Int
    let description: String
    let tags: [String]
    let avatar: String
}

struct GameResult {
    let winner: String
    let playerRating: Int
    let opponentRating: Int
    let moves: [String]
    let opponentMessage: String
}

enum NavigationDestination: Hashable {
    case playBots
    case botSelection
    case preGameLobby(ChessBot)
    case activeGame(ChessBot)
    case gameResult(GameResult)
}

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to destination: NavigationDestination) {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
}