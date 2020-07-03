import CoreData

class CoreDataInitializer {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HPApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func provideContext () -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext () {
              if provideContext().hasChanges {
                  do {
                      try provideContext().save()
                  } catch {
                      let nserror = error as NSError
                      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                  }
              }
          }
}
