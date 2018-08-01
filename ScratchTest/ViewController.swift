//
//  ViewController.swift
//  ScratchTest
//
//  Created by Haehyeon Jeong on 2018. 8. 1..
//  Copyright © 2018년 Haehyeon Jeong. All rights reserved.
//

import UIKit
import ScratchCard

class ViewController: UIViewController, ScratchUIViewDelegate {
    
    var scratchView : ScratchUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scratchView  = ScratchUIView(frame: CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height),Coupon: self.view.asImage(), MaskImage: "mask.png", ScratchWidth: CGFloat(40))
        scratchView.delegate = self
        self.view.addSubview(scratchView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Scratch Began Event(optional)
    func scratchBegan(_ view: ScratchUIView) {
        print("scratchBegan")
        
        ////Get the Scratch Position in ScratchCard(coordinate origin is at the lower left corner)
        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
        print(position)
        
    }
    
    //Scratch Moved Event(optional)
    func scratchMoved(_ view: ScratchUIView) {
        let scratchPercent: Double = self.scratchView.getScratchPercent()
        print("scratchPercent : \(scratchPercent)")
//        print("scratchMoved")
        ////Get the Scratch Position in ScratchCard(coordinate origin is at the lower left corner)
        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
        print(position)
        
        if scratchPercent > 0.1 {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
                self.scratchView.alpha = 0
            }) { (result) in
//                self.scratchView.isHidden = true
            }
        }
    }
    
    //Scratch Ended Event(optional)
    func scratchEnded(_ view: ScratchUIView) {
        print("scratchEnded")
        
        ////Get the Scratch Position in ScratchCard(coordinate origin is at the lower left corner)
        let position = Int(view.scratchPosition.x).description + "," + Int(view.scratchPosition.y).description
        print(position)
        
    }

}

