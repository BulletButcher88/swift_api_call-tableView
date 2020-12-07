
import UIKit


class PhotoCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureLable: UILabel!
    
    func setPhoto(photo: Photo) {
        pictureImageView.image = photo.url
        pictureLable.text = photo.author
    }
}



