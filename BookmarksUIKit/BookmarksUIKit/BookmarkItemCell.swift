import UIKit
import SnapKit

class BookmarkItemCell: UITableViewCell {
    var link = ""
    private let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var linkButton: UIButton = {
        let btnImage = UIImage(named: "link")
        let button = UIButton()
        button.setImage(btnImage, for: .normal)
        button.addTarget(self, action: #selector(linkButtonDidPress), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func configure (name: String, link1: String) {
        titleLabel.text = name
        link = link1
    }

    func toLink() {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc private func linkButtonDidPress() {
        toLink()
    }
    
    private func setupUI() {
        self.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(1)
            make.bottom.equalToSuperview().offset(-1)
            make.height.equalTo(60)
            
            customView.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(12)
                make.centerY.equalToSuperview()
                self.contentView.addSubview(linkButton)
                linkButton.snp.makeConstraints { make in
                    make.trailing.equalToSuperview().offset(-10)
                    make.width.equalTo(24)
                    make.height.equalTo(24)
                    make.centerY.equalToSuperview()
                }
            }
        }
    }
}
