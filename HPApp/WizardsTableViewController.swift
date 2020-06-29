import UIKit

class WizardsTableViewController: UITableViewController {
    
    var characters: [Characters] = []
    let injection = Injection()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wizardCell", for: indexPath) as! WizardsCell

            print(self.characters)
            let character = self.characters[indexPath.row]
            print(character)
            cell.prepare(with: character)
       
        return cell
    }

}
