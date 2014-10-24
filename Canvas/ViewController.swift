//
//  ViewController.swift
//  Canvas
//
//  Created by Amanda Atwood on 10/23/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var downArrow: UIImageView!
    @IBOutlet weak var trayView: UIView!
    var originalTrayViewLocation: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTrayViewLocation = trayView.center
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDownArrow(sender: UIPanGestureRecognizer) {
        
        
       var velocity = sender.velocityInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
             println(sender.locationInView(view))
        }
        
        else if sender.state == UIGestureRecognizerState.Changed {
            println(sender.translationInView(view))
            if sender.locationInView(view).y + 104 < originalTrayViewLocation.y {
                trayView.center.y = originalTrayViewLocation.y
            }
            else {
                trayView.center.y = sender.locationInView(view).y + 104
            }
        }
        
        else if sender.state == UIGestureRecognizerState.Ended {
            println(sender.velocityInView(view))
            if velocity.y > 0 {
                
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil,animations: { () -> Void in
                    self.trayView.center.y = self.originalTrayViewLocation.y + 170
                    }, completion: { (finished: Bool) -> Void in
                        self.downArrow.transform = CGAffineTransformMakeRotation(CGFloat(180 * M_PI / 180))
                })
                
            }
            if velocity.y < 0 {
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                    self.trayView.center.y = self.originalTrayViewLocation.y
                    }, completion: { (finished: Bool) -> Void in
                    self.downArrow.transform = CGAffineTransformMakeRotation(CGFloat(0 * M_PI / 180))
                })
            
            }
        }
    }

}

