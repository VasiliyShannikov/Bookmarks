import Foundation
import UIKit
import SnapKit

class WelcomeScreen: UIViewController {
    let vc  = BookmarksList()
    
    @objc private func buttonDidPress() {
        UserDefaults.standard.set(true, forKey: "firstLaunch")
        
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }
    
    lazy var bgImage: UIImageView = {
         let image = UIImage(named:  "image 8")
         let imageView = UIImageView(image: image)
         return imageView
     }()
    
    lazy var label : UILabel = {
            let lbl = UILabel()
            lbl.numberOfLines = 2
            lbl.text = "Save all interesting links in one app"
            lbl.textColor = .white
            lbl.font = UIFont.systemFont(ofSize: 36, weight: .bold)//label.font.withSize(36)
            lbl.lineBreakMode = .byTruncatingTail
        return lbl
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Let’s start ", for: .normal)
        button.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var rectangle: UIView = {
        let rtgl = UIView()
        rtgl.backgroundColor = .white
        rtgl.layer.cornerRadius = 16
        rtgl.isUserInteractionEnabled = true
        return rtgl
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        PostData().get { lm in
            Storage.links = lm
            print("data is loaded from wellcome screen")
            print("Storage.links = \(Storage.links.count)")
        }
        view.addSubview(bgImage)
        view.addSubview(label)
        view.addSubview(rectangle)
    
        rectangle.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerY.equalTo(rectangle.snp.centerY)
            make.centerX.equalTo(rectangle.snp.centerX)
        }
      
        bgImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(bgImage.snp.bottom).offset(16)
            make.width.equalTo(358)
            make.height.equalTo(92)
            make.centerX.equalTo(bgImage.snp.centerX)
        }
        
        rectangle.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.width.equalTo(358)
            make.height.equalTo(58)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    override func loadView() {
        print(#function)
        let blueView = UIView()
        blueView.backgroundColor = .black
        view = blueView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
}
