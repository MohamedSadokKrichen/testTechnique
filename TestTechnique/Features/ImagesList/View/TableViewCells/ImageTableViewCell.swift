
import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likeNumberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        mainView.roundCorners(.allCorners, radius: 30)
        mainView.dropShadow()
        mainImageView.roundCorners([.topLeft, .topRight], radius: 30)
        userImageView.roundCorners(.allCorners, radius: 25)
        
    }
    
}
