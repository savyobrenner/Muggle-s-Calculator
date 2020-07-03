import UIKit

class SpellsTableViewController: UITableViewController {
    
    let injection = Injection()
    let spinner = UIActivityIndicatorView(style: .large)
    var spells: [Spells] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        injection.loading.startLoad(element: spinner) {
            self.tableView.backgroundView = self.spinner
        }
        
        DispatchQueue.main.async {
            self.injection.spellsService.getAllSpells(onSuccess: { (spells) in
                self.spells = spells
                self.tableView.reloadData()
                self.injection.loading.stopLoading(element: self.spinner)
            }) { (error) in
                print(error)
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellCell", for: indexPath) as! SpellCell
        let spell = self.spells[indexPath.row]
        cell.prepare(with: spell)
        return cell
    }

}
