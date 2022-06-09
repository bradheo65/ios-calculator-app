//
//  Calculator - CalculatorViewController.swift
//  Created by Brad.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var firstNumberLable: UILabel!
    @IBOutlet weak var secondNumberLable: UILabel!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var secondOperatorLabel: UILabel!
    
    @IBOutlet weak var previousValues: UIScrollView!
    @IBOutlet weak var valuesStackView: UIStackView!
    
    let numberFormatter = NumberFormatter()
    var calculatorModel = CalculatorModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultLabels()
        settingNumberFormaatter()
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        let operand: String = calculatorModel.addOperand(to: buttonTitle)
        numberLabel.text = operand
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }
        
        let operatorSign = calculatorModel.addOperatorStorage(to: buttonTitle)
        operatorLabel.text = operatorSign
        makeStackLabel(test: operatorSign)
        numberLabel.text = "0"
    }

    private func defaultLabels() {
        numberLabel.text = "0"
        operatorLabel.text = ""
        firstNumberLable.removeFromSuperview()
        secondNumberLable.removeFromSuperview()
        firstOperatorLabel.removeFromSuperview()
        secondOperatorLabel.removeFromSuperview()
    }

    private func settingNumberFormaatter() {
        numberFormatter.roundingMode = .floor
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 3
    }
    
    private func makeStackLabel(test: String) {
        guard let numberLabelValue = numberLabel.text else {
            return
        }
        let stackView = UIStackView()
        let stackNumberLabel = UILabel()
        let stackOperatorLabel = UILabel()
        let bottomOffSetY = previousValues.contentSize.height - previousValues.bounds.height + numberLabel.font.lineHeight
        let bottomOffset = CGPoint(x: 0, y: bottomOffSetY)
        
        previousValues.setContentOffset(bottomOffset, animated: false)
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        
        isCheckMakeStackLabel(test: test, to: numberLabelValue, from: stackNumberLabel, from: stackOperatorLabel)
        
        stackView.addArrangedSubview(stackOperatorLabel)
        stackView.addArrangedSubview(stackNumberLabel)
        valuesStackView.addArrangedSubview(stackView)
    }
    
    private func isCheckMakeStackLabel(test: String, to numberLabelValue: String, from stackNumberLabel: UILabel, from stackOperatorLabel: UILabel) {
        
        if calculatorModel.userIsInTheMiddleOfTyping {
            stackNumberLabel.text = numberLabelValue
            stackOperatorLabel.text = " \(calculatorModel.presentOperator) "
       
            
            return
        }
        stackNumberLabel.text = numberLabelValue
       
    }
}
