//
//  GameScene.swift
//  meuPrimeiroJogo
//
//  Created by Clara Thaís Maciel e Silva on 01/04/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var vermelho : SKShapeNode = {
        let vermelho = SKShapeNode(circleOfRadius: 100)
        vermelho.fillColor = .red
        return vermelho
    }() // sem parenteses vira variavel calculada, com ele vira funçao para que nao chame de novo a variavel vermelho, vai guardar e pegar a que ja foi feita na primeira vez
    
    // OU ( tanto a de cima quanto de baixo fazem a mesma coisa)
    
//    private var vermelho2 : SKShapeNode = GameScene.geraVermelho()
//
//    static func geraVermelho()-> SKShapeNode {
//        let vermelho = SKShapeNode(circleOfRadius: 100)
//        vermelho.fillColor = .red
//        return vermelho
//    }
    
    let cores: [UIColor] = [.red, .blue, .brown, .cyan, .darkGray]
    var colorIndex: Int = 0
    
//
    override func didMove(to view: SKView) { // }
    
        super.didMove(to:view)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(vermelho)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touche = touches.first else { // Pega o primeiro toque na tela
            print("Sem toque")
            return
        }
        let location = touche.location(in: self) // location recebe o local tocado na tela
        
        
        guard let node = self.nodes(at: location).first else { // um local fora do circulo
            let action = SKAction.move(to: location, duration: 1) // tempo 1 é rapido, 2 mais devagar
            vermelho.run(action)
            print("Nao tem nada")
            return
            // node é o tipo mais generico de lable
        }
        guard let shape = node as? SKShapeNode else {
            print("isso é um shape")
            return
        }
        
        colorIndex += 1
        colorIndex = colorIndex % cores.count
        shape.fillColor = cores[colorIndex]
        
        let novaDistancia = CGVector (dx: Int.random(in: -30...30), dy:  Int.random(in: -30...30))
        let action = SKAction.move(by: novaDistancia, duration: 1)
        // SKAction pode fazer a bola crescer, se mover, diminuir, combinar açoes, etc
        
        shape.run(action)
    }
    
}
