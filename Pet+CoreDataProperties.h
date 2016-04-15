//
//  Pet+CoreDataProperties.h
//  CoreDataUniqueTest
//
//  Created by Brian Papa on 4/14/16.
//  Copyright © 2016 theskimm. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Pet.h"

NS_ASSUME_NONNULL_BEGIN

@interface Pet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Person *person;

@end

NS_ASSUME_NONNULL_END
