import UIKit

class SpellCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbEffect: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with spell: Spells){
        lbName.text = spell.spell
        lbType.text = "Type: " + spell.type
        lbEffect.text = "Effect: " + spell.effect
    }

}
