//
//  Job+CoreDataProperties.h
//  CoreDataUniqueTest
//
//  Created by Brian Papa on 4/15/16.
//  Copyright © 2016 theskimm. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Job.h"

NS_ASSUME_NONNULL_BEGIN

@interface Job (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) Person *person;

@end

NS_ASSUME_NONNULL_END
