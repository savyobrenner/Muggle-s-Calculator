import UIKit
import WebKit

class WizardDetailsController: UIViewController {
    
    @IBOutlet weak var lbWizardName: UILabel!
    @IBOutlet weak var lbRole: UILabel!
    @IBOutlet weak var lbHouse: UILabel!
    @IBOutlet weak var lbSchool: UILabel!
    @IBOutlet weak var lbBloodStatus: UILabel!
    @IBOutlet weak var lbWand: UILabel!
    @IBOutlet weak var lbPatronus: UILabel!
    @IBOutlet weak var lbAnimagus: UILabel!
    @IBOutlet weak var lbFear: UILabel!
    @IBOutlet weak var lbAssociations: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    var ministryMagic: Bool!, orderPhoenix: Bool!, dumbledoreArmy: Bool!, deathEate: Bool!
    var wizardName: String!, role: String!, house: String!, school: String!, bloodStatus: String!, wand: String!, patronus: String!, animagus: String!, fear: String!
    
    let injection = Injection()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMainInfos()
        confiWebServices()
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func configMainInfos(){
        lbWizardName.text = wizardName!
        lbRole.text = role!
        lbHouse.text = house!
        lbSchool.text = school!
        lbBloodStatus.text = bloodStatus!
        lbWand.text = wand!
        lbPatronus.text = patronus!
        lbAnimagus.text = animagus!
        lbFear.text = fear!
        associations()
        self.isModalInPresentation = true
    }
    
    private func confiWebServices(){
        injection.loading.startLoad(element: spinner, completion: nil)
        injection.webKitService.search(name: wizardName) { (request) in
            self.webView.uiDelegate = self
            self.webView.navigationDelegate = self
            self.webView.load(request)
        }
        
    }
    
    private func associations(){
        if ministryMagic {
            lbAssociations.text = "Ministry of Magic Employee"
        } else if orderPhoenix {
            lbAssociations.text = "Order of Phoenix Member"
        } else if dumbledoreArmy {
            lbAssociations.text = "Dumbledore Army Member"
        } else if deathEate {
            lbAssociations.text = "Death Eate Member"
        } else {
            lbAssociations.text = "No public association"
        }
    }
}

extension WizardDetailsController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("acabou")
        injection.loading.stopLoading(element: spinner)
    }
}
