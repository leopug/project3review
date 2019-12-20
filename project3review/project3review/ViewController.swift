import UIKit

class ViewController: UITableViewController {

    var countries =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Banderolas Great!"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria",
        "poland","russia","spain","uk","us"]
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailFlag") as? FlagDetailViewController {
            vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

