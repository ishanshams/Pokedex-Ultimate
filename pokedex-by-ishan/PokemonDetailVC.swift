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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLbl: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLbl.text = pokemon.name
        
        var img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done
            print("DID WE GET HERE")
            self.updateUI()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokedexLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        if pokemon.nextEvolutionID == "" {
            evoLbl.text = "No Evolutions"
            nextEvoLbl.hidden = true
        }
        else {
            nextEvoLbl.hidden = false
            nextEvoLbl.image = UIImage(named: pokemon.nextEvolutionID)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " \(pokemon.nextEvolutionLvl)"
            }
            
            evoLbl.text = str
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}
