//: Sort an Array by Object's Value

class Player {
    
    let name: String!
    let highScore : Int!
    
    init(name: String, highScore: Int) {
        self.name = name
        self.highScore = highScore
    }
}

let curry       = Player(name: "Curry", highScore: 58)
let harden      = Player(name: "Harden", highScore: 53)
let james       = Player(name: "James", highScore: 62)
let westbrook   = Player(name: "Westbrook", highScore: 56)
let jordan      = Player(name: "Jordan", highScore: 9000)

var players: [Player] = [curry, harden, james, westbrook, jordan]

let highScores = players.sorted(by: {$0.highScore > $1.highScore})
