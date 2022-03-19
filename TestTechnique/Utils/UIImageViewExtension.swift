import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async { /// execute on main thread
                    self.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}
