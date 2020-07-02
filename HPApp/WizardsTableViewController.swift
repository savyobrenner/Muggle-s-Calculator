import UIKit

class WizardsTableViewController: UITableViewController {
    
    var characters: [Characters] = []
    let injection = Injection()
    let spinner = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        injection.loading.startLoad(element: spinner) {
            self.tableView.backgroundView = self.spinner
        }
        
        DispatchQueue.main.async {
            self.injection.charactersService.getAllCharacters(onSuccess: { (characters) in
                self.characters = characters
                self.tableView.reloadData()
                self.injection.loading.stopLoading(element: self.spinner)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wizardDetails"{
            let indexPath = tableView.indexPathForSelectedRow!
            let character: Characters? = characters[indexPath.row]
            let vc = segue.destination as! WizardDetailsController
            prepareInformationsForSegue(vc, character)
            tableView.deselectRow(at: indexPath, animated: true)

        }
    }
}
