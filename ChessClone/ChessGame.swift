import SwiftUI

enum PieceType: String, CaseIterable {
    case pawn, rook, knight, bishop, queen, king
    
    var whiteSymbol: String {
        switch self {
        case .pawn: return "♙"
        case .rook: return "♖"
        case .knight: return "♘"
        case .bishop: return "♗"
        case .queen: return "♕"
        case .king: return "♔"
        }
    }
    
    var blackSymbol: String {
        switch self {
        case .pawn: return "♟"
        case .rook: return "♜"
        case .knight: return "♞"
        case .bishop: return "♝"
        case .queen: return "♛"
        case .king: return "♚"
        }
    }
}

enum PieceColor {
    case white, black
    
    var opposite: PieceColor {
        self == .white ? .black : .white
    }
}

struct ChessPiece {
    let type: PieceType
    let color: PieceColor
    
    var symbol: String {
        color == .white ? type.whiteSymbol : type.blackSymbol
    }
}

struct Position: Equatable {
    let row: Int
    let col: Int
}

class ChessGame: ObservableObject {
    @Published var board: [[ChessPiece?]] = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    @Published var currentPlayer: PieceColor = .white
    @Published var selectedPosition: Position?
    @Published var possibleMoves: [Position] = []
    @Published var gameStatus = "White to move"
    
    init() {
        setupBoard()
    }
    
    func setupBoard() {
        // Clear board
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)
        
        // Setup white pieces
        board[7][0] = ChessPiece(type: .rook, color: .white)
        board[7][1] = ChessPiece(type: .knight, color: .white)
        board[7][2] = ChessPiece(type: .bishop, color: .white)
        board[7][3] = ChessPiece(type: .queen, color: .white)
        board[7][4] = ChessPiece(type: .king, color: .white)
        board[7][5] = ChessPiece(type: .bishop, color: .white)
        board[7][6] = ChessPiece(type: .knight, color: .white)
        board[7][7] = ChessPiece(type: .rook, color: .white)
        
        for col in 0..<8 {
            board[6][col] = ChessPiece(type: .pawn, color: .white)
        }
        
        // Setup black pieces
        board[0][0] = ChessPiece(type: .rook, color: .black)
        board[0][1] = ChessPiece(type: .knight, color: .black)
        board[0][2] = ChessPiece(type: .bishop, color: .black)
        board[0][3] = ChessPiece(type: .queen, color: .black)
        board[0][4] = ChessPiece(type: .king, color: .black)
        board[0][5] = ChessPiece(type: .bishop, color: .black)
        board[0][6] = ChessPiece(type: .knight, color: .black)
        board[0][7] = ChessPiece(type: .rook, color: .black)
        
        for col in 0..<8 {
            board[1][col] = ChessPiece(type: .pawn, color: .black)
        }
    }
    
    func selectSquare(at position: Position) {
        if let selectedPos = selectedPosition {
            if possibleMoves.contains(position) {
                makeMove(from: selectedPos, to: position)
            }
            selectedPosition = nil
            possibleMoves = []
        } else if let piece = board[position.row][position.col], piece.color == currentPlayer {
            selectedPosition = position
            possibleMoves = getPossibleMoves(for: position)
        }
    }
    
    func makeMove(from: Position, to: Position) {
        board[to.row][to.col] = board[from.row][from.col]
        board[from.row][from.col] = nil
        currentPlayer = currentPlayer.opposite
        gameStatus = currentPlayer == .white ? "White to move" : "Black to move"
    }
    
    func getPossibleMoves(for position: Position) -> [Position] {
        guard let piece = board[position.row][position.col] else { return [] }
        var moves: [Position] = []
        
        switch piece.type {
        case .pawn:
            moves = getPawnMoves(from: position, color: piece.color)
        case .rook:
            moves = getRookMoves(from: position)
        case .knight:
            moves = getKnightMoves(from: position)
        case .bishop:
            moves = getBishopMoves(from: position)
        case .queen:
            moves = getQueenMoves(from: position)
        case .king:
            moves = getKingMoves(from: position)
        }
        
        return moves.filter { isValidMove(from: position, to: $0) }
    }
    
    func getPawnMoves(from position: Position, color: PieceColor) -> [Position] {
        var moves: [Position] = []
        let direction = color == .white ? -1 : 1
        let startRow = color == .white ? 6 : 1
        
        // Forward move
        let oneStep = Position(row: position.row + direction, col: position.col)
        if isInBounds(oneStep) && board[oneStep.row][oneStep.col] == nil {
            moves.append(oneStep)
            
            // Two steps from start
            if position.row == startRow {
                let twoSteps = Position(row: position.row + 2 * direction, col: position.col)
                if isInBounds(twoSteps) && board[twoSteps.row][twoSteps.col] == nil {
                    moves.append(twoSteps)
                }
            }
        }
        
        // Captures
        for colOffset in [-1, 1] {
            let capturePos = Position(row: position.row + direction, col: position.col + colOffset)
            if isInBounds(capturePos), let piece = board[capturePos.row][capturePos.col], piece.color != color {
                moves.append(capturePos)
            }
        }
        
        return moves
    }
    
    func getRookMoves(from position: Position) -> [Position] {
        var moves: [Position] = []
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
        
        for (rowDir, colDir) in directions {
            for i in 1..<8 {
                let newPos = Position(row: position.row + i * rowDir, col: position.col + i * colDir)
                if !isInBounds(newPos) { break }
                
                if let piece = board[newPos.row][newPos.col] {
                    if piece.color != board[position.row][position.col]?.color {
                        moves.append(newPos)
                    }
                    break
                } else {
                    moves.append(newPos)
                }
            }
        }
        
        return moves
    }
    
    func getKnightMoves(from position: Position) -> [Position] {
        let knightMoves = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
        return knightMoves.compactMap { (rowOffset, colOffset) in
            let newPos = Position(row: position.row + rowOffset, col: position.col + colOffset)
            return isInBounds(newPos) ? newPos : nil
        }
    }
    
    func getBishopMoves(from position: Position) -> [Position] {
        var moves: [Position] = []
        let directions = [(1, 1), (1, -1), (-1, 1), (-1, -1)]
        
        for (rowDir, colDir) in directions {
            for i in 1..<8 {
                let newPos = Position(row: position.row + i * rowDir, col: position.col + i * colDir)
                if !isInBounds(newPos) { break }
                
                if let piece = board[newPos.row][newPos.col] {
                    if piece.color != board[position.row][position.col]?.color {
                        moves.append(newPos)
                    }
                    break
                } else {
                    moves.append(newPos)
                }
            }
        }
        
        return moves
    }
    
    func getQueenMoves(from position: Position) -> [Position] {
        return getRookMoves(from: position) + getBishopMoves(from: position)
    }
    
    func getKingMoves(from position: Position) -> [Position] {
        let kingMoves = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]
        return kingMoves.compactMap { (rowOffset, colOffset) in
            let newPos = Position(row: position.row + rowOffset, col: position.col + colOffset)
            return isInBounds(newPos) ? newPos : nil
        }
    }
    
    func isInBounds(_ position: Position) -> Bool {
        return position.row >= 0 && position.row < 8 && position.col >= 0 && position.col < 8
    }
    
    func isValidMove(from: Position, to: Position) -> Bool {
        guard isInBounds(to) else { return false }
        
        if let targetPiece = board[to.row][to.col] {
            return targetPiece.color != board[from.row][from.col]?.color
        }
        
        return true
    }
    
    func resetGame() {
        setupBoard()
        currentPlayer = .white
        selectedPosition = nil
        possibleMoves = []
        gameStatus = "White to move"
    }
}