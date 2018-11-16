//
//  LessonService.swift
//  Let it snow
//
//  Created by Anton Huisamen on 2018/11/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import Foundation
import CoreData

enum LessonType: String {
    case ski, snowboard
}

typealias StudentHandler = (Bool, [Student]) -> ()

class LessonService {
    private let moc: NSManagedObjectContext
    private var students = [Student]()
    
    init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func addStudent(name: String, for type: LessonType, completion: StudentHandler){
        let student = Student(context: moc)
        student.name = name
        
        if let lesson = lessonExists(type) {
           register(student, for: lesson)
            students.append(student)
            
            completion(true, students)
        }
        
        save()
    }
    
    private func lessonExists(_ type: LessonType) -> Lesson? {
        let request: NSFetchRequest<Lesson> = Lesson.fetchRequest()
        request.predicate = NSPredicate(format: "type = %@", type.rawValue)
        var lesson: Lesson?
        do {
            let result = try moc.fetch(request)
            lesson = result.isEmpty ? addNew(lesson: type) : result.first
        } catch let error as NSError {
            print("Error getting lesson: \(error.localizedDescription)")
        }
        return lesson
    }
    
    private func addNew(lesson type: LessonType) -> Lesson {
        let lesson = Lesson(context: moc)
        lesson.type = type.rawValue
        
        return lesson
    }
    
    private func register(_ student: Student, for lesson: Lesson) {
        student.lesson = lesson
    }
    
    private func save() {
        do {
            try moc.save()
        } catch let error as NSError {
            print("Save failed: \(error.localizedDescription)")
        }
    }
}
