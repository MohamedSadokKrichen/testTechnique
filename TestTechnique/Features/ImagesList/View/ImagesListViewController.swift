import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var presenter: ViewToPresenterImagesListProtocol?
    var imagesList: ImagesEntity?
    var pageIndex = 1
    var totalPages = 0
    var result = [Result]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUIComponents()
    }
    func setupUIComponents() {
        self.title = LIST_IMAGES_TITLE
        searchTextField.withImageOnTheLeft(image: SEARCH_ICON)
        searchTextField.roundCorners(.allCorners, radius: 10)
    }
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ImageTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
    @IBAction func searchBtnAction(_ sender: Any) {
        if let searchWord = searchTextField.text, searchWord != "" {
            searchTextField.resignFirstResponder()
            result.removeAll()
            self.showHud()
            presenter?.searchForImage(with: searchWord.trimmingCharacters(in: .whitespacesAndNewlines), pageIndex: 1)
        } else {
            self.showError(with: ERROR_TITLE, message: ERROR_TEXT_EMPTY)
        }
        
    }
}

extension ImagesListViewController: PresenterToViewImagesListProtocol {
    func showImagesList(images: ImagesEntity) {
        self.hideHUD()
        self.result.append(contentsOf: images.results ?? [Result]())
        self.totalPages = images.total_pages ?? 0
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        self.hideHUD()
        result.removeAll()
        self.tableView.reloadData()
        self.showError(with: ERROR_TITLE, message: error)
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageTableViewCell.self)) as! ImageTableViewCell
        let imageData = result[indexPath.row]
        cell.mainImageView.imageFromUrl(urlString: imageData.urls?.regular ?? "")
        cell.userImageView.imageFromUrl(urlString: imageData.user?.profile_image?.medium ?? "")
        cell.userNameLabel.text = imageData.user?.username
        cell.likeNumberLabel.text = "\(imageData.likes ?? 0)"
        cell.descriptionLabel.text = imageData.alt_description
        return cell
    }
}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 10.0 {
            if pageIndex < totalPages {
                pageIndex += 1
                showHud()
                if let searchWord = searchTextField.text, searchWord != "" {
                    presenter?.searchForImage(with: searchWord.trimmingCharacters(in: .whitespacesAndNewlines), pageIndex: pageIndex)
                }
            }
            
        }
    }
}
