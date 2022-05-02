//
//  Persistance.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 5/2/22.
//

import UIKit
import CoreData
import Foundation

func save(_ name: String) {
  
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
      return
    }
  
    let managedContext = appDelegate.persistentContainer.viewContext
  
    let entity = NSEntityDescription.entity(forEntityName: "Day", in: managedContext)!
  
    let day = NSManagedObject(entity: entity, insertInto: managedContext)
  
    day.setValue(name, forKeyPath: "name")
  
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
}

func get() -> [NSManagedObject]? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
  
    let managedContext = appDelegate.persistentContainer.viewContext
  
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
  
    do {
        return try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }

    return nil
}


