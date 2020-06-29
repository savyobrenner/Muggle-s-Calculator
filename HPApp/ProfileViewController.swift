import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var lbWelcome: UILabel!
    @IBOutlet weak var lbInformations: UILabel!
    @IBOutlet weak var lbMagicCode: UILabel!
    @IBOutlet weak var tfMagicCode: UITextField!
    @IBOutlet weak var btUpdate: UIButton!
    
    let injection = Injection()


    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateView()
    }

    @IBAction func update(_ sender: UIButton) {
        
    }
    
    
    func animateView(){
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
            self.ivProfilePic.alpha = 1
            self.lbWelcome.alpha = 1
            self.lbMagicCode.alpha = 1
            self.lbInformations.alpha = 1
            self.lbMagicCode.alpha = 1
            self.tfMagicCode.alpha = 1
            self.btUpdate.alpha = 1
        })
    }
}
