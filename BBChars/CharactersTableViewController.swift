//
//  CharactersViewController.swift
//  BBChars
//
//  Created by Yuri Ershov on 22.01.22.
//

import UIKit

class CharactersTableViewController: UIViewController {
    
    enum Segues {
        static let characterDetail = "ToCharacterDetailViewController"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension CharactersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO:  need to replace with actual return
        return 116
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO:  need to replace with actual return
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.characterDetail, sender: self)
    }
}
