import UIKit

class WizardsTableViewController: UITableViewController {
    
    var characters: [Characters] = []
    let injection = Injection()
    
    //http://www.google.com.br/search?q=(name)&tbm=isch

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.injection.charactersService.getAllCharacters(onSuccess: { (characters) in
                self.characters = characters
                self.tableView.reloadData()
            }) { (error) in
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! WizardsCell

            let character = self.characters[indexPath.row]
            cell.prepare(with: character)
       
        return cell
    }

}
