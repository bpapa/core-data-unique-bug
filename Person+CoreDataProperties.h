//
//  Person+CoreDataProperties.h
//  CoreDataUniqueTest
//
//  Created by Brian Papa on 4/15/16.
//  Copyright © 2016 theskimm. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@class Pet, Job;

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *personID;
@property (nullable, nonatomic, retain) Pet *pet;
@property (nullable, nonatomic, retain) Job *job;

@end

NS_ASSUME_NONNULL_END
