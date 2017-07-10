//
//  RootViewController.swift
//  UIPageViewController
//
//  Created by Vijay Adhikari on 10/07/2017.
//  Copyright © 2017 Vijay Adhikari. All rights reserved.
//

import UIKit

class RootViewController: UIPageViewController , UIPageViewControllerDataSource {

    
    lazy var viewControllerList:[UIViewController] = {
        let storyB = UIStoryboard(name: "Main" , bundle: nil)
       
        let vc1 = storyB.instantiateViewController(withIdentifier: "redVC")
        let vc2 = storyB.instantiateViewController(withIdentifier: "greenVC")
        let vc3 = storyB.instantiateViewController(withIdentifier: "voiletVC")
        let vc4 = storyB.instantiateViewController(withIdentifier: "blueVC")
        
        return [vc1,vc2,vc3,vc4]
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
        
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

    }


    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard viewControllerList.count > previousIndex else {return nil}
        
        return viewControllerList[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil}
        
        guard  viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
        
    }
    
    
    
    
}
