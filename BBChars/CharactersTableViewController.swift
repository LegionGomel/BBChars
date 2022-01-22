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
    
    enum Cells {
        static let characterCell = "CharacterCell"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
//    var manager =
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

    
extension CharactersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.characterCell, for: indexPath)
        cell.textLabel?.text = "Test \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.characterDetail, sender: nil)
    }
}
