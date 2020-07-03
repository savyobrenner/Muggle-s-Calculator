import UIKit

class  CalculatorController: UIViewController {
    
    
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var magicView: UIView!
    
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var perfomingMath: Bool = false
    var operation = 0
    var result = ""

    let injection = Injection()
    
    var operationLabel: [Tag: String] = [Tag.dividerTag:"/", Tag.multiplicationTag:"x", Tag.subtractionTag:"-", Tag.sumTag:"+"]
    var operationExpression: [Tag:()->String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operationExpression = [Tag.dividerTag: {self.divide()}, Tag.multiplicationTag: {self.multiplication()}, Tag.subtractionTag:{self.subtraction()}, Tag.sumTag:{self.sum()}]
        magicView.isHidden = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            self.addCode()
        }
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if perfomingMath == true {
            lbResult.text = String(sender.tag-1)
            numberOnScreen = Double(lbResult.text!)!
            perfomingMath = false
        }
        else {
            lbResult.text = lbResult.text! + String(sender.tag-1)
            numberOnScreen = Double(lbResult.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if lbResult.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(lbResult.text!)!
            
            lbResult.text = operationLabel[Tag(rawValue: sender.tag)!]
            
            
            if sender.tag == 18{
                
                if !previousNumber.isLess(than: 0.0){
                    lbResult.text = String("-\(previousNumber)")
                } else {
                    lbResult.text = String(String("\(previousNumber)").dropFirst())
                }
            }
            
            if sender.tag == 19{
                if numberOnScreen == Double(injection.dataManager.returnMagicCode()){
                    magicView.isHidden = false
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
                        self.magicView.backgroundColor = .red
                    }
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                        self.magicView.backgroundColor = .white
                    }
                    Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { (timer) in
                        self.magicView.backgroundColor = .blue
                    }
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
                        self.performSegue(withIdentifier: "magicPeople", sender: nil)
                    }
                }
            }
            
            operation = sender.tag
            
            perfomingMath = true
            
        }
        if operationExpression[Tag(rawValue: sender.tag)!] != nil {
            result = operationExpression[Tag(rawValue: sender.tag)!]!()
        }
            
        else if sender.tag == 16 {
            if previousNumber != 0 {
            result = operationExpression[Tag(rawValue: operation)!]!()
            lbResult.text = String(result)
            }
        }
            
        else if sender.tag == 11{
            
            lbResult.text = ""
            
            previousNumber = 0;
            
            numberOnScreen = 0;
            
            operation = 0;
            
        }
        
    }
    
    private func addCode(){
        if injection.dataManager.isCodeEmpty() {
            injection.alerts.showAlertWithTextField(titulo: "Welcome to Muggle's Calculator", mensagem: "Now, you have to chose whats is your magic code to access the special content.                                                                                                                     (The default code is 0000, for access you just have to write the sequence and press '%'.)",
                                                    on: self, onDone: { (result) in
                self.injection.dataManager.addCode(magicCode: String(result))
            }) { (defaultResult) in
                self.injection.dataManager.addCode(magicCode: String(defaultResult))
            }
        }
    }
    
    private func divide()-> String{
        let result = injection.expressionResolver(type: .divide).execute(previousNumber, numberOnScreen)
        return String(result)
    }
    private func sum()-> String{
        let result = injection.expressionResolver(type: .sum).execute(previousNumber, numberOnScreen)
        return String(result)
    }
    private func subtraction()-> String{
        let result = injection.expressionResolver(type: .subtraction).execute(previousNumber, numberOnScreen)
        return String(result)
    }
    private func multiplication()-> String{
        let result = injection.expressionResolver(type: .multiplication).execute(previousNumber, numberOnScreen)
        return String(result)
    }
}

enum Tag: Int {
    case clearTag = 11
    case dividerTag = 12
    case multiplicationTag = 13
    case subtractionTag = 14
    case sumTag = 15
    case result = 16
    case changeSignalTag = 18
    case percent = 19
}

