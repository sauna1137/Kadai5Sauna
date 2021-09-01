//
//  ViewController.swift
//  Kadai5Sauna
//
//  Created by KS on 2021/08/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var textFields: [UITextField]!
    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        textFields[0].keyboardType = .numberPad
        textFields[1].keyboardType = .numberPad
    }

    @IBAction private func calculateResultButton(_ sender: Any) {
        calculateResult()
    }

    private func calculateResult() {
        guard let num1 = Double(textFields[0].text!) else {
            showAlert(irregulerStrings: "notEnteredNum1")
            return
        }

        guard let num2 = Double(textFields[1].text!) else {
            showAlert(irregulerStrings: "notEnteredNum2")
            return
        }

        if num2 == 0 {
            showAlert(irregulerStrings: "num2==0")
            textFields[1].text = ""
            return
        }

        let result = num1/num2
        resultLabel.text = String(result)
        view.endEditing(true)
    }

    private func showAlert(irregulerStrings: String) {
        switch irregulerStrings {
        case "num2==0":
            let alertController = UIAlertController(title: "課題5", message: "割る数に0を入力しないでください", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)

        case "notEnteredNum1":
            let alertController = UIAlertController(title: "課題5", message: "割られる数を入力して下さい", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)

        case "notEnteredNum2":
            let alertController = UIAlertController(title: "課題5", message: "割る数を入力して下さい", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)

        default:break
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
