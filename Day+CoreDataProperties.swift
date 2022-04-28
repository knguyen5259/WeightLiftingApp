//
//  Day+CoreDataProperties.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 4/28/22.
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
