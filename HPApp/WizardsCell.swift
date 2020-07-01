import UIKit

class WizardsCell: UITableViewCell {
    
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecie: UILabel!
    @IBOutlet weak var lbBloodStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepare(with character: Characters){
        lbName.text = character.name
        lbSpecie.text = "Specie: " + character.species
        lbBloodStatus.text = "Blood: " + character.bloodStatus.rawValue
    }
}
