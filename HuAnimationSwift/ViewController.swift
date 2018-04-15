//
//  ViewController.swift
//  HuAnimationSwift
//
//  Created by Shichimitoucarashi on 2018/04/15.
//  Copyright © 2018年 keisuke yamagishi. All rights reserved.
//

import UIKit

enum Type : Int{
    case HUTransition = 0
    case HUGhostAnimator = 1
    case HUHorizontalLinesAnimator = 2
    case HUVerticalLinesAnimator = 3
}

class ViewController: UIViewController, UINavigationControllerDelegate, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    var type: Type = Type(rawValue: 0)!
    
    let animation = ["HUTransitionAnimator",
                     "HUTransitionGhostAnimator",
                     "HUTransitionHorizontalLinesAnimator",
                     "HUTransitionVerticalLinesAnimator"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HUTransitionAnimator"
        let view: UIView = UIView(frame: self.view.bounds)
        
        let gragient = ColorUtil().gradient(start: "4cd964", end: "ffcb00")
        gragient.frame = view.frame
        view.layer.addSublayer(gragient)
        self.table.backgroundView = view
        
        self.table.delegate = self
        self.table.dataSource = self
        
        self.navigationController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        print ("HIT")
        var trangition :HUTransitionAnimator? = nil
        switch self.type {
        case .HUTransition:
            trangition = HUTransitionAnimator()
            break
        case .HUGhostAnimator :
            trangition = HUTransitionGhostAnimator()
            break
        case .HUHorizontalLinesAnimator :
            trangition = HUTransitionHorizontalLinesAnimator()
            break
        case .HUVerticalLinesAnimator :
            trangition = HUTransitionVerticalLinesAnimator()
            break
        }
        
        trangition?.presenting = (operation == .pop) ? false:true
        
        return trangition
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = animation[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.type = Type(rawValue: indexPath.row)!
        
        let detail:Detail = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! Detail
        detail.title = animation[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
        
    }

}

