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
            presentAlert(message: "割られる数を入力して下さい")
            return
        }

        guard let num2 = Double(textFields[1].text!) else {
            presentAlert(message: "割る数を入力して下さい")
            return
        }

        guard num2 != 0 else {
            presentAlert(message: "割る数に0を入力しないでください")
            textFields[1].text = ""
            return
        }

        let result = num1 / num2
        resultLabel.text = String(result)
        view.endEditing(true)
    }

    private func presentAlert(message: String) {
        let alertController = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
