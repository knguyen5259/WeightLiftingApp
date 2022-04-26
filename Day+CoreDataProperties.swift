//
//  Day+CoreDataProperties.swift
//  WeightLiftApp
//
//  Created by furqan amanji on 4/26/22.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var name: String?

}

extension Day : Identifiable {

}
