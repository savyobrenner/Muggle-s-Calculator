import Foundation
import UIKit

class Alerts{
    
    func showAlertWithTextField (titulo: String, mensagem: String, `on` controller: UIViewController, onDone: @escaping (Int)-> Void, onCancel: @escaping (Int)-> Void){
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Ok!", style: .default){ (UIAlertAction) in
    
            onDone(Int((alert.textFields?.first?.text)!)!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive){ (UIAlertAction) in
            onCancel(0)
        }
        alert.addTextField { (textfield) in
            textfield.placeholder = "Chose your magic code"
            textfield.keyboardType = .numberPad
        }
        alert.addAction(cancelAction)
        alert.addAction(doneAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
}
