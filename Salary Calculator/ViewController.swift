

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bachelors: UIButton!
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var diploma: UIButton!
    
    @IBOutlet weak var highSchool: UIButton!
    
    @IBOutlet weak var single: UIButton!
    @IBOutlet weak var notSingle: UIButton!
    @IBOutlet weak var noOfChild: UITextField!
    @IBOutlet weak var childLabel: UILabel!
    @IBOutlet weak var childClause: UILabel!
    @IBOutlet weak var java: UIButton!
    @IBOutlet weak var swift: UIButton!
    @IBOutlet weak var python: UIButton!
    
    @IBOutlet weak var javaScript: UIButton!
    
    @IBOutlet weak var cSharp: UIButton!
    
    @IBOutlet weak var php: UIButton!
    
    @IBOutlet weak var experienceYears: UILabel!
    @IBOutlet weak var rLanguage: UIButton!
    @IBOutlet weak var salaryValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        header.text = "Hai Welcome to Salary Calculator"
        salaryValue.text = ""
        experienceYears.text = "0"
    }

    var totalSalary:Double = 0.0
    var qualification = 0
    var programming1 = 0
    var programming2 = 0
    
    @IBAction func bachelor(_ sender: Any) {
        bachelors.isSelected = true
        diploma.isSelected = false
        highSchool.isSelected = false
        qualification = 1
    }
    @IBAction func diploma(_ sender: Any) {
        bachelors.isSelected = false
        diploma.isSelected = true
        highSchool.isSelected = false
        qualification = 2
    }
    @IBAction func hSchool(_ sender: Any) {
        bachelors.isSelected = false
        diploma.isSelected = false
        highSchool.isSelected = true
        qualification = 3
    }
    
    
    
    @IBAction func singleClicked(_ sender: Any) {
        single.isSelected = true
        notSingle.isSelected = false
        
        noOfChild.isHidden = true
        noOfChild.text = "0"
        childLabel.isHidden = true
        childClause.isHidden = true
    }
    @IBAction func notSingleClicked(_ sender: Any) {
        single.isSelected = false
        notSingle.isSelected = true
        
        
        noOfChild.isHidden = false
        noOfChild.text = ""
        childLabel.isHidden = false
        childClause.isHidden = false
    }
    
    
    
    @IBAction func javaclicked(_ sender: Any) {
        if java.isSelected{
            java.isSelected = false
            if javaScript.isSelected || cSharp.isSelected{
                programming2 = 1
            }else{
                programming2 = 0
            }
        }else {
            java.isSelected = true
            programming2 = 1
        }
    }
    @IBAction func swiftClicked(_ sender: Any) {
        if swift.isSelected{
            swift.isSelected = false
            if python.isSelected || rLanguage.isSelected{
                programming1 = 1
            }else{
                programming1 = 0
            }
        }else {
            swift.isSelected = true
            programming1 = 1
        }
    }
    @IBAction func pythonClicked(_ sender: Any) {
        if python.isSelected{
            python.isSelected = false
            if swift.isSelected || rLanguage.isSelected{
                programming1 = 1
            }else{
                programming1 = 0
            }
        }else {
            python.isSelected = true
            programming1 = 1
        }
    }
    @IBAction func javaScriptClicked(_ sender: Any) {
        if javaScript.isSelected{
            javaScript.isSelected = false
            if java.isSelected || cSharp.isSelected{
                programming2 = 1
            }else{
                programming2 = 0
            }
        }else {
            javaScript.isSelected = true
            programming2 = 1
        }
    }
    @IBAction func cSharpClicked(_ sender: Any) {
        if cSharp.isSelected{
            cSharp.isSelected = false
            if javaScript.isSelected || java.isSelected{
                programming2 = 1
            }else{
                programming2 = 0
            }
        }else {
            cSharp.isSelected = true
            programming2 = 1
        }
    }
    @IBAction func phpClicked(_ sender: Any) {
        if php.isSelected{
            php.isSelected = false
        }else {
            php.isSelected = true
        }
    }
    @IBAction func rLangClicked(_ sender: Any) {
        if rLanguage.isSelected{
            rLanguage.isSelected = false
            if swift.isSelected || python.isSelected{
                programming1 = 1
            }else{
                programming1 = 0
            }
        }else {
            rLanguage.isSelected = true
            programming1 = 1
        }
    }
    
    
    
    @IBAction func expStepper(_ sender: UIStepper) {
        experienceYears.text = String(Int(sender.value))
    }
    
    @IBAction func getEst(_ sender: Any) {
        
        if bachelors.isSelected || diploma.isSelected || highSchool.isSelected {
            
            switch qualification{
            case 1:
                totalSalary = 55000.0
            case 2:
                totalSalary = 47000.0
            case 3:
                totalSalary = 40000.0
            default:
                totalSalary = 0.0
            }
            
            let childNo:Int = Int(noOfChild.text!) ?? 0
            if childNo > 0{
                totalSalary += (7000.0 * Double(childNo))
            }
        
            
            if programming1 == 1 {
                totalSalary += 5000.0
            }
            if programming2 == 1 {
                totalSalary += 3000.0
            }
            
            let expYears:Int = Int(experienceYears.text!)!
            if expYears > 3{
                totalSalary += 10000.0
            }
            
            salaryValue.text = String(format: "%.2f", totalSalary)
            
        }else{
            salaryValue.text = ""
            header.text = "Please Select Qualification"
        }
    }
    
    
}

