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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = character?.name ?? "Nobody"
    }
}
