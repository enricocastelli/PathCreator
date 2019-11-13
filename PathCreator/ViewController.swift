//
//  ViewController.swift
//  PathCreator
//
//  Created by Enrico Castelli on 05/11/2019.
//  Copyright © 2019 EC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: UIView!
    
    @IBOutlet weak var startXLabel: UILabel!
    @IBOutlet weak var startYLabel: UILabel!
    @IBOutlet weak var cp1XLabel: UILabel!
    @IBOutlet weak var cp1YLabel: UILabel!
    @IBOutlet weak var cp2XLabel: UILabel!
    @IBOutlet weak var cp2YLabel: UILabel!
    @IBOutlet weak var finalXLabel: UILabel!
    @IBOutlet weak var finalYLabel: UILabel!
    
    @IBOutlet weak var startXStepper: UIStepper!
    @IBOutlet weak var startYstepper: UIStepper!
    @IBOutlet weak var cp1Xstepper: UIStepper!
    @IBOutlet weak var cp1Ystepper: UIStepper!
    @IBOutlet weak var cp2Xstepper: UIStepper!
    @IBOutlet weak var cp2Ystepper: UIStepper!
    @IBOutlet weak var finalXstepper: UIStepper!
    @IBOutlet weak var finalYstepper: UIStepper!

    var path = UIBezierPath()
    var lineLayer = LineLayer()
    var startPoint: CGPoint { return CGPoint(x: startXLabel.float, y: startYLabel.float) }
    var cp1Point: CGPoint { return CGPoint(x: cp1XLabel.float, y: cp1YLabel.float) }
    var cp2Point: CGPoint { return CGPoint(x: cp2XLabel.float, y: cp2YLabel.float) }
    var finalPoint: CGPoint { return CGPoint(x: finalXLabel.float, y: finalYLabel.float) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.layer.borderColor = UIColor.gray.cgColor
        canvasView.layer.borderWidth = 5
        canvasView.layer.addSublayer(lineLayer)
    }

    @IBAction func stepperTapped(_ sender: UIStepper) {
        switch sender.tag {
        case 0: startXLabel.text = String(describing: sender.value)
        case 1: startYLabel.text = String(describing: sender.value)
        case 2: cp1XLabel.text = String(describing: sender.value)
        case 3: cp1YLabel.text = String(describing: sender.value)
        case 4: cp2XLabel.text = String(describing: sender.value)
        case 5: cp2YLabel.text = String(describing: sender.value)
        case 6: finalXLabel.text = String(describing: sender.value)
        case 7: finalYLabel.text = String(describing: sender.value)
        default: fatalError("stepper tag not expected")
        }
        changePath()
    }
    
    func changePath() {
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addCurve(to: finalPoint, controlPoint1: cp1Point, controlPoint2: cp2Point)
        lineLayer.path = path.cgPath
    }
    
    func testPath() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 400, y: 400))
        lineLayer.path = path.cgPath
    }

    
}


extension UILabel {
    
    var float: CGFloat {
        return CGFloat(Double(text ?? "") ?? 0)
    }
}

class LineLayer: CAShapeLayer {
    
    override init() {
        super.init()
        strokeColor = UIColor.black.cgColor
        fillColor = UIColor.clear.cgColor
        lineWidth = 5
        masksToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
