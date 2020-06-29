import UIKit

class WizardsCell: UITableViewCell {
    
    
    @IBOutlet weak var ivWizardPhoto: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecie: UILabel!
    @IBOutlet weak var lbBloodStatus: UILabel!
    @IBOutlet weak var lbMinistryEmployee: UILabel!
    

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
        lbSpecie.text = character.species
        lbBloodStatus.text = character.bloodStatus.rawValue
        lbMinistryEmployee.text = String(character.ministryOfMagic)
    }
}
