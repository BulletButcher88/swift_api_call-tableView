
import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var photos:[MyResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData {_ in
            self.tableView.reloadData()
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
}
    
    func fetchData(completionHandler: @escaping ([MyResult]) -> Void) {
        
        let url = URL(string: "https://picsum.photos/v2/list")!
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do{
                self.photos = try JSONDecoder().decode([MyResult].self, from: data)
                DispatchQueue.main.async { [self] in
                completionHandler(photos)
                }
            }
            catch{
                let error = error
                print(error.localizedDescription)
            }
    }
        dataTask.resume()
    }
    
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }


    internal func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        
        let photo = photos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
        cell.setPhoto(photo: photos)
        return cell
    }
}





