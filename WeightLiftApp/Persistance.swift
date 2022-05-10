//
//  Persistance.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 5/2/22.
//

import UIKit
import CoreData
import Foundation

class Persistance {

    public static func save(_ excercise: String, _ dayToUse: String) -> Exercise? {
      
        guard let appDelegate =
          UIApplication.shared.delegate as? AppDelegate else {
          return nil
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
      
        let entity = NSEntityDescription.entity(forEntityName: "Exercise", in: managedContext)!

        let day = NSManagedObject(entity: entity, insertInto: managedContext)
      
        day.setValue(excercise, forKeyPath: "name")
        day.setValue(dayToUse, forKey: "day")
      
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return day as! Exercise
    }

    public static func get(_ dayToUse: String) -> [Exercise]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
      
        let managedContext = appDelegate.persistentContainer.viewContext
      
        let fetchRequest = NSFetchRequest<Exercise>(entityName: "Exercise")
        var managedObjects: [Exercise] = []
        do {
            managedObjects = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
        
        var finalObjects: [Exercise] = []
        
        for x in managedObjects {
            if x.day == dayToUse {
                finalObjects.append(x)
            }
        }
        
        return finalObjects
    }
    
    public static func delete(_ excercise: Exercise) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(excercise)

        do {
            try managedContext.save()
        } catch {
            
        }
    }
    
}
