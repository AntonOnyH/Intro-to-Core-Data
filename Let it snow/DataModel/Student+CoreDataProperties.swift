//
//  Student+CoreDataProperties.swift
//  Let it snow
//
//  Created by Anton Huisamen on 2018/11/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var lesson: Lesson?

}
