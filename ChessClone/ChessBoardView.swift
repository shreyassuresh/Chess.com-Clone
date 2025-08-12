import SwiftUI

struct ChessBoardView: View {
    @ObservedObject var game: ChessGame
    
    var body: some View {
        VStack(spacing: 0) {
            // Column labels (a-h)
            HStack(spacing: 0) {
                Spacer().frame(width: 20)
                ForEach(0..<8, id: \.self) { col in
                    Text(String(Character(UnicodeScalar(97 + col)!)))
                        .font(.caption)
                        .frame(width: 40, height: 20)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack(spacing: 0) {
                // Row labels (8-1)
                VStack(spacing: 0) {
                    ForEach(0..<8, id: \.self) { row in
                        Text("\(8 - row)")
                            .font(.caption)
                            .frame(width: 20, height: 40)
                            .foregroundColor(.secondary)
                    }
                }
                
                // Chess board
                VStack(spacing: 0) {
                    ForEach(0..<8, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<8, id: \.self) { col in
                                ChessSquareView(
                                    position: Position(row: row, col: col),
                                    piece: game.board[row][col],
                                    isSelected: game.selectedPosition == Position(row: row, col: col),
                                    isPossibleMove: game.possibleMoves.contains(Position(row: row, col: col)),
                                    isLight: (row + col) % 2 == 0
                                ) {
                                    game.selectSquare(at: Position(row: row, col: col))
                                }
                            }
                        }
                    }
                }
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct ChessSquareView: View {
    let position: Position
    let piece: ChessPiece?
    let isSelected: Bool
    let isPossibleMove: Bool
    let isLight: Bool
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(squareColor)
                .frame(width: 40, height: 40)
            
            if isPossibleMove {
                Circle()
                    .fill(Color.green.opacity(0.6))
                    .frame(width: piece != nil ? 35 : 12, height: piece != nil ? 35 : 12)
            }
            
            if let piece = piece {
                Text(piece.symbol)
                    .font(.system(size: 28))
                    .foregroundColor(.primary)
            }
            
            if isSelected {
                Rectangle()
                    .stroke(Color.blue, lineWidth: 3)
                    .frame(width: 40, height: 40)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
    
    var squareColor: Color {
        if isSelected {
            return Color.blue.opacity(0.3)
        }
        return isLight ? Color(.systemGray5) : Color(.systemGray3)
    }
}