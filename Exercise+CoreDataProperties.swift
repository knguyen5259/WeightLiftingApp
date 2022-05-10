//
//  Exercise+CoreDataProperties.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 5/10/22.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String?
    @NSManaged public var day: String?

}

extension Exercise : Identifiable {

}
