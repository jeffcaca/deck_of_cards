//: Playground - noun: a place where people can play

import UIKit
struct Card {
    var rank: String
    var suit: String
    var numvalue: Int
}




class Deck {
    var cards: [Card]
    let suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
    let values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    
    init(){
        self.cards = []
        self.makedeck()
    }
    // this can also be a reset
    func makedeck(){
        for suit in suits{
            for idx in 0..<values.count{
                self.cards.append(Card(rank: values[idx], suit: suit, numvalue: idx))
            }
        }
    }
    // selects one card removes it from the deck and then returns it
    func deal() -> Card{
        let lastcard = cards.removeLast()
        
        return lastcard
    }
    // shuffle the deck 10 times
    func shuffle(){
        let numofcards = self.cards.count
        let shufflenum = 10
        for _ in 1...shufflenum{
            let randomcard1 = Int(arc4random_uniform(UInt32(numofcards)))
            let randomcard2 = Int(arc4random_uniform(UInt32(numofcards)))
            let temp = cards[randomcard1]
            cards[randomcard1] = cards[randomcard2]
            cards[randomcard2] = temp
            
           
        }
    }
    
}
class Player {
    var name: String
    var hand: [Card]
    init (name: String){
        self.name = name
        self.hand = []
    }
    func draw(deck: Deck) -> Card {
        let card = deck.deal()
        hand.append(card)
       
        return card
    }
    func discard(card: Card) -> Bool{
        for i in 0...self.hand.count-1{
            if self.hand[i].numvalue == card.numvalue && self.hand[i].suit == card.suit{
                self.hand.remove(at: i)
                return true
            }
            
        }
        return false
      
    }
    func showdeck(){
        print(hand)
    }
}

//Testing the deck and player

var deck1 = Deck()
var player1 = Player(name: "Jeff")
deck1.shuffle()
var getcard = player1.draw(deck: deck1)
getcard = player1.draw(deck: deck1)
player1.showdeck()
player1.discard(card: getcard)
player1.showdeck()



