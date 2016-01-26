/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Constants
  private let horizontalPadding: CGFloat = 15.0
  
  // MARK: - Variables
  @IBOutlet private weak var iconImageView: UIImageView!
  @IBOutlet private weak var appNameLabel: UILabel!
  @IBOutlet private weak var skipButton: UIButton!
  @IBOutlet private weak var appImageView: UIImageView!
  @IBOutlet private weak var welcomeLabel: UILabel!
  @IBOutlet private weak var summaryLabel: UILabel!
  @IBOutlet private weak var pageControl: UIPageControl!
  
  // MARK: - Properties
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let metrics = ["hp":horizontalPadding,"iconImageViewWidth":30.0]
    //1
    let views:[String: AnyObject] = [
      "iconImageView":iconImageView,
      "appNameLabel":appNameLabel,
      "skipButton":skipButton,
      "appImageView":appImageView,
      "welcomeLabel":welcomeLabel,
      "summaryLabel":summaryLabel,
      "pageControl":pageControl,
      "topLayoutGuide":topLayoutGuide,
      "bottomLayGuide":bottomLayoutGuide
    ]
    
    var allConstraints = [NSLayoutConstraint]()
    
    let iconVerticalContraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[topLayoutGuide]-[iconImageView(30)]", options: [], metrics: nil, views: views)
    allConstraints += iconVerticalContraints
    
    let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-hp-[iconImageView(iconImageViewWidth)]-[appNameLabel]-[skipButton]-hp-|", options: [.AlignAllCenterY], metrics: metrics, views: views)
    allConstraints += horizontalConstraints
    
    let summaryHorizontalContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-hp-[summaryLabel]-hp-|", options: [], metrics: metrics, views: views)
    allConstraints += summaryHorizontalContraints
    
    let summaryVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[welcomeLabel]-4-[summaryLabel]", options: [.AlignAllLeading,.AlignAllTrailing], metrics: nil, views: views)
    allConstraints += summaryVerticalConstraints
    
    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[summaryLabel]-15-[pageControl(9)]-15-|", options: [.AlignAllCenterX], metrics: nil, views: views)
    allConstraints += summaryToPageVerticalConstraints
    
    let iconToImageVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[iconImageView]-10-[appImageView]", options: [], metrics: nil, views: views)
    allConstraints += iconToImageVerticalConstraints
    
    let imageToWelcomVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[appImageView]-10-[welcomeLabel]", options: [.AlignAllCenterX], metrics: nil, views: views)
    allConstraints += imageToWelcomVerticalConstraints
    
    NSLayoutConstraint.activateConstraints(allConstraints)
  }
  // MARK: - TableView Data Source
  
  // MARK: - TableView Delegate
  
  // MARK: - Custom Delegate
  
  // MARK: - Event Response
  
  // MARK: - Private Methods
  
  // MARK: - Navigation
 
}










































































