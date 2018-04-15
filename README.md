# HUAnimatorSwift

[![](https://img.shields.io/badge/Twitter-O--Liker%20Error-blue.svg)](https://twitter.com/O_Linker_Error)
[![](https://img.shields.io/badge/Language-Ruby-red.svg)](https://www.ruby-lang.org/ja/)
[![](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/keisukeYamagishi/xsort/blob/master/LICENSE)

## Overview 

It rewrote HUAnimator with swift.

Please refer to the following site.

https://github.com/cinkster/HUAnimator


## Use it
***Via SSH***: For those who plan on regularly making direct commits, cloning over SSH may provide a better experience (which requires uploading SSH keys to GitHub):

```
$ git clone git@github.com:keisukeYamagishi/HUAnimatorSwift.git
```
***Via https***: For those checking out sources as read-only, HTTPS works best:

```
$ git clone https://github.com/keisukeYamagishi/HUAnimatorSwift.git
```

## Sample code

use UINavigationControllerDelegate 

```
class ViewController: UIViewController, UINavigationControllerDelegate {  <= use it

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }
}
```

Declaration

```
optional func navigationController(_ navigationController: UINavigationController, 
            animationControllerFor operation: UINavigationControllerOperation, 
                              from fromVC: UIViewController, 
                                to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
```

## Coding

```


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

```
