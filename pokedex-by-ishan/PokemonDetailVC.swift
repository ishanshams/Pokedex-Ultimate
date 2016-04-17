//
//  PokemonDetailVC.swift
//  pokedex-by-ishan
//
//  Created by Ishan Shams on 4/17/16.
//  Copyright © 2016 Ishan Shams. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLbl.text = pokemon.name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
