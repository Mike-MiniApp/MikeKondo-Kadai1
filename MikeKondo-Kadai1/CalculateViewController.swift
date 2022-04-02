//
//  ViewController.swift
//  MikeKondo-Kadai1
//
//  Created by 近藤米功 on 2022/03/20.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet private var numberTextFields: [UITextField]!
    @IBOutlet private weak var calculateResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldDelegateSelf()
        setUpTextFieldKeyBoardType()
    }
    @IBAction private func tappedCalculateButton(_ sender: Any) {
        var numberArray: [Int] = Array(repeating: 0, count: 5)
        for numberIndex in 0..<5 {
            numberArray[numberIndex] = Int(numberTextFields[numberIndex].text ?? "") ?? 0
        }
        // 入力された数の合計数を代入
        calculateResultLabel.text = "\(numberArray.reduce(0, +))"
    }
    private func setUpTextFieldDelegateSelf() {
        numberTextFields.forEach {
            $0.delegate = self
        }
    }
    private func setUpTextFieldKeyBoardType() {
        for numberIndex in 0..<5 {
            numberTextFields[numberIndex].keyboardType = UIKeyboardType.numberPad
        }
        numberTextFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension CalculateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
