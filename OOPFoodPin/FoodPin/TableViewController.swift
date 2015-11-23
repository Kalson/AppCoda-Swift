//
//  TableViewController.swift
//  FoodPin
//
//  Created by KaL on 11/3/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var restaurantNames: [String] = []
    var restaurantImages: [String] = []
    var restaurantLocations: [String] = []
    var restaurantTypes: [String] = []
    var restaurantIsVisited = [Bool](count:21, repeatedValue:false)
    
     var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = [
            Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
            Restaurant(name: "Homei", type: "Cafe", location: "HongKong", image: "homei.jpg", isVisited: false),
            Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
            Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
            Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
            Restaurant(name: "For Kee Restaurant", type: "Bakery" , location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
            Restaurant(name: "Po's Atelier", type: "Bakery" , location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
            Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
            Restaurant(name: "Haigh’s Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
            Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
            Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
            Restaurant(name: "Traif", type: "American" , location: "New York", image: "traif.jpg", isVisited: false),
            Restaurant(name: "Graham Avenue Meats And Deli", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
            Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea" , location: "New York", image: "wafflewolf.jpg", isVisited: false),
            Restaurant(name: "Five Leaves", type: "Coffee & Tea" , location: "New York", image: "fiveleaves.jpg", isVisited: false),
            Restaurant(name: "Cafe Lore", type: "Latin American" , location: "New York", image: "cafelore.jpg", isVisited: false),
            Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
            Restaurant(name: "Barrafina", type: "Spanish" , location: "London", image: "barrafina.jpg", isVisited: false),
            Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
            Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
            Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "thaicafe.jpg", isVisited: false)
        ]
    
        self.tableView.reloadData()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.TypeLabel.text = restaurants[indexPath.row].type
        cell.thumbNailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbNailImageView.layer.cornerRadius = cell.thumbNailImageView.frame.size.width/2
        cell.thumbNailImageView.clipsToBounds = true
        
        if restaurantIsVisited[indexPath.row]{
            cell.accessoryType = .Checkmark

        } else {
            cell.accessoryType = .None

        }

        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurantImage = restaurants[indexPath.row].image
                destinationController.nameText = restaurants[indexPath.row].name
                destinationController.locationText = restaurants[indexPath.row].location
                destinationController.typeText = restaurants[indexPath.row].type

            }
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareRowAction = UITableViewRowAction(style: .Default, title: "Share") { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            let shareAlert = UIAlertController(title: nil, message: "Share using", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

            shareAlert.addAction(twitterAction)
            shareAlert.addAction(facebookAction)
            shareAlert.addAction(emailAction)
            shareAlert.addAction(cancelAction)
            
            self.presentViewController(shareAlert, animated: true, completion: nil)
        }
        
        let deleteRowAction = UITableViewRowAction(style:.Default, title: "Delete") { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            print("total items = \(self.restaurants.count)")
            for restaurant in self.restaurants{
                print("restaurant left = \(restaurant.name)")
            }
        }
        
        shareRowAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        return [deleteRowAction,shareRowAction]
    }
    
    
//    -      shareRowAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        let callHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//       
//        let isVisitAction = UIAlertAction(title: "I've been here", style: .Default) {(UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            
//            if cell?.accessoryType == UITableViewCellAccessoryType.None{
//                cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
//                self.restaurantIsVisited[indexPath.row] = true
//            } else {
//                cell?.accessoryType = UITableViewCellAccessoryType.None
//                self.restaurantIsVisited[indexPath.row] = false
//            }
//            
//            
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callHandler)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(isVisitAction)
//
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            restaurantNames.removeAtIndex(indexPath.row)
//            restaurantLocations.removeAtIndex(indexPath.row)
//            restaurantTypes.removeAtIndex(indexPath.row)
//            restaurantIsVisited.removeAtIndex(indexPath.row)
//            restaurantImages.removeAtIndex(indexPath.row)
//            
//            print("total items = \(restaurantNames.count)")
//            for name in restaurantNames{
//                print(name)
//            }
//            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
   
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
