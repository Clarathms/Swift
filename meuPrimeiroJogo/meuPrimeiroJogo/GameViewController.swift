//
//  GameViewController.swift
//  meuPrimeiroJogo
//
//  Created by Clara Thaís Maciel e Silva on 01/04/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = self.view as! SKView? else { fatalError("Se ferrou")}  // enxerga a view (self.view) como se fosse uma skview (view de games)
        let scene = GameScene (size:UIScreen.main.bounds.size)
        
        scene.scaleMode = .aspectFill
        
        // UIScreen -> Tela | main : tela principal do cel, sem considerar espelhamentos | bounds : Bordas
        
        view.presentScene(scene)
            
        view.showsFPS = true
        view.showsNodeCount = true
        }
}

