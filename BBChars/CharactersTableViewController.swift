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
    
    var manager = NetworkManager()
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.getCharacters { [weak self] (result) in
            
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let characters):
                DispatchQueue.main.async {
                    self?.characters = characters
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

    
extension CharactersTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.characterCell, for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.characterDetail, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
