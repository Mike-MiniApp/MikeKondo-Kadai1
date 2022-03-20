//
//  ViewController.swift
//  MikeKondo-Kadai1
//
//  Created by 近藤米功 on 2022/03/20.
//

import UIKit

class ViewController: UIViewController {
    // TODO: Outlet Collectionを使用してTextFieldをまとめる
    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var number3TextField: UITextField!
    @IBOutlet private weak var number4TextField: UITextField!
    @IBOutlet private weak var number5TextField: UITextField!
    
    @IBOutlet weak var calculateResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: このメソッドの命名はあまり適切出ない気がする
        textFieldDelegateSelf()
        textFieldKeyBoardTyep()
    }
    @IBAction func tappedCaculateButton(_ sender: Any) {
        // TODO: コードが冗長なのでなんとかしたい
        let number1: Int = Int(number1TextField.text ?? "") ?? 0
        let number2: Int = Int(number2TextField.text ?? "") ?? 0
        let number3: Int = Int(number3TextField.text ?? "") ?? 0
        let number4: Int = Int(number4TextField.text ?? "") ?? 0
        let number5: Int = Int(number5TextField.text ?? "") ?? 0
        calculateResultLabel.text = String(addtionAction(num1: number1, num2: number2, num3: number3, num4: number4, num5: number5))
    }
    private func addtionAction(num1: Int,num2: Int,num3: Int,num4: Int,num5: Int) -> Int{
        num1+num2+num3+num4+num5
    }
    private func textFieldDelegateSelf(){
        number1TextField.delegate = self
        number2TextField.delegate = self
        number3TextField.delegate = self
        number4TextField.delegate = self
        number5TextField.delegate = self
    }
    private func textFieldKeyBoardTyep(){
        number1TextField.keyboardType = UIKeyboardType.numberPad
        number2TextField.keyboardType = UIKeyboardType.numberPad
        number3TextField.keyboardType = UIKeyboardType.numberPad
        number4TextField.keyboardType = UIKeyboardType.numberPad
        number5TextField.keyboardType = UIKeyboardType.numberPad
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

