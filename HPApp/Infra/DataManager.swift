import Foundation
import CoreData

class DataManager {

    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext ) {
        self.context = context
    }
    
    func addCode(magicCode: String){
        let entity = NSEntityDescription.entity(forEntityName: "CodeInformation", in: context)!
        let code = NSManagedObject(entity: entity, insertInto: context)
        code.setValue(Int(magicCode), forKey: "magicCode")
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func updateCode(magicCode: String){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CodeInformation")
            do{
                let result = try context.fetch(fetchRequest) as? [NSManagedObject]
                if result?.count != 0 {
                    result![0].setValue(Int(magicCode), forKey: "magicCode")
                }
            }catch{
                fatalError("Error is retriving titles items")
            }
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    func returnMagicCode() -> Int{
        var magicCode = 0000
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CodeInformation")
            do{
                let result = try context.fetch(fetchRequest) as? [NSManagedObject]
                magicCode = result![0].value(forKey: "magicCode") as! Int
            }catch{
                fatalError("Error is retriving titles items")
            }
        return magicCode
    }
    
    func isCodeEmpty() -> Bool {
        var boll = true
        if returnMagicCode() != 0 {
            boll = false
        }
        return boll
        }
    
   
}
