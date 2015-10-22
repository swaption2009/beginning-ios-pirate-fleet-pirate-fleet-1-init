//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 0), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 1), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 0, y: 2), isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x: 0, y: 3), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 4), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 5, y: 1), explosionText: "bomb1")
        let mine2 = Mine(location: GridLocation(x: 5, y: 3), explosionText: "bomb2")

        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        
        let numberOfGuesses = gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman
        
        finalScore = (enemyShipsSunk * gameStats.sinkBonus) + (humanShipsRemaining * gameStats.shipBonus) - (numberOfGuesses * gameStats.guessPenalty)
        
        print("the value of final score is: ", finalScore)
        
        return finalScore
    }
}