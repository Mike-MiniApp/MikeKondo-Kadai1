//
//  ViewController.swift
//  MikeKondo-Kadai1
//
//  Created by 近藤米功 on 2022/03/20.
//

import UIKit

class CalculateViewController: UIViewController{
    @IBOutlet var numberTextField: [UITextField]!
    @IBOutlet weak var calculateResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: このメソッドの命名はあまり適切でないように思えるのでFBいただきたいです。
        textFieldDelegateSelf()
        textFieldKeyBoardTyep()
    }
    @IBAction func tappedCalculateButton(_ sender: Any) {
        var numberArray: [Int] = Array(repeating: 0, count: 5)
        for i in 0..<5{
            numberArray[i] = Int(numberTextField[i].text ?? "") ?? 0
        }
        // 入力された数の合計数を代入
        calculateResultLabel.text = String(numberArray.reduce(0, +))

    }
    private func textFieldDelegateSelf(){
        for i in 0..<5{
            numberTextField[i].delegate = self
        }
    }
    private func textFieldKeyBoardTyep(){
        for i in 0..<5{
            numberTextField[i].keyboardType = UIKeyboardType.numberPad
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension CalculateViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

