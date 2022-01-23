//
//  CharacterDetailViewController.swift
//  BBChars
//
//  Created by Yuri Ershov on 22.01.22.
//

import UIKit

class CharactersDetailViewController: UIViewController {
    
    var character: Character?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()

    }
    
    func updateLabels() {
        if let character = character {
            nameLabel.text = character.name
            nickNameLabel.text = "Also known as: \(character.nickname)"
            birthDateLabel.text = "Birth date: \(character.birthday)"
            actorNameLabel.text = "Played by: \(character.portrayed)"
            var occupations = ""
            for occupation in character.occupation {
               occupations += occupation + "; "
            }
            occupationLabel.text = "Professions in TV series: \n \(occupations)"
            
        }
    }
}
