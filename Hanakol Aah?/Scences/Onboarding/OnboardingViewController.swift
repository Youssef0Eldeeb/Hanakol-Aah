//
//  OnboardingViewController.swift
//  Hanakol Aah?
//
//  Created by Youssef Eldeeb on 30/03/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var curvedVeiw: UIView!
    
    let currentLanguage = Locale.current.language.languageCode?.identifier
    var slides: [OnboardingSlides] = []
    var currentPage = 0 {
        didSet{
            if currentPage == slides.count - 1 {
                pageControl.isHidden = true
                startBtn.isHidden = false
                skipBtn.isHidden = true
            }else{
                pageControl.isHidden = false
                startBtn.isHidden = true
                skipBtn.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slides = [
            .init(image: UIImage(named:"onboard01")!, title: NSLocalizedString("onboard01Title", comment: ""), description:  NSLocalizedString("onboard01Description", comment: "")),
            .init(image: UIImage(named:"onboard02")!, title: NSLocalizedString("onboard02Title", comment: ""), description:  NSLocalizedString("onboard02Description", comment: "")),
            .init(image: UIImage(named:"onboard03")!, title: NSLocalizedString("onboard03Title", comment: ""), description:  NSLocalizedString("onboard03Description", comment: ""))
        ]
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        initUI()
//         change srolling dircation if collctionView to RTL
        if currentLanguage == "ar"{
            onboardingCollectionView.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
        
        
    }
    
    @IBAction func skipBtn(_ sender: UIButton) {
        currentPage += 1
        print(currentPage," \n")
        let indexPath = IndexPath(item: currentPage, section: 0)
        
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        onboardingCollectionView.isPagingEnabled = true
        pageControl.currentPage = currentPage
        titleLabel.text = slides[currentPage].title
        descriptionLabel.text = slides[currentPage].description
    }
    @IBAction func startBtn(_ sender: UIButton) {
        let controller = RegistrationViewController.instantiateVC(name: .Registration)
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        UserDefaults.standard.hasOnboarded = true
        present(controller, animated: true)
    }
    
    
    func initUI(){
        onboardingCollectionView.registerNib(cell: OnboardingCollectionViewCell.self)
        pageControl.numberOfPages = slides.count
        pageControl.isHidden = false
        startBtn.isHidden = true
        titleLabel.text = slides[0].title
        descriptionLabel.text = slides[0].description
        startBtn.cornerRedius = 20
        curvedVeiw.cornerRedius = 20
        skipBtn.setTitle(NSLocalizedString("onboardingSkipBtn", comment: ""), for: .normal)
        startBtn.setTitle(NSLocalizedString("onboardingStartBtn", comment: ""), for: .normal)
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCollectionView.dequeue(indexPath: indexPath) as OnboardingCollectionViewCell
        
        if currentLanguage == "ar"{
            print(slides.reversed()[indexPath.row].image , "\n")
            cell.setImage(image: slides.reversed()[indexPath.row].image)
            cell.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }else{
            cell.setImage(image: slides[indexPath.row].image)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        titleLabel.text = slides[currentPage].title
        descriptionLabel.text = slides[currentPage].description
        print(currentPage," \n")
    }
    
    
}
