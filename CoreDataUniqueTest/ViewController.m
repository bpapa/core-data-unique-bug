//
//  ViewController.m
//  CoreDataUniqueTest
//
//  Created by Brian Papa on 4/13/16.
//  Copyright © 2016 theskimm. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Pet.h"
#import "AppDelegate.h"
#import "Job.h"
@import CoreData;

@interface ViewController ()
@property NSManagedObjectContext *childMainThreadManagedObjectContext;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.childMainThreadManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.childMainThreadManagedObjectContext.parentContext = self.rootManagedObjectContext;
    self.childMainThreadManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.rootManagedObjectContext];
    person.personID = @"theID";
    person.job = [NSEntityDescription insertNewObjectForEntityForName:@"Job" inManagedObjectContext:self.rootManagedObjectContext];
    person.job.title = @"iOS Dev";
    
    NSError *saveError;
    if (self.childMainThreadManagedObjectContext.hasChanges && ![self.childMainThreadManagedObjectContext save:&saveError]) {
        NSLog(@"%@", saveError);
    }
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate saveContext];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender {
    NSManagedObjectContext *nestedPrivateQueueContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    nestedPrivateQueueContext.parentContext = self.childMainThreadManagedObjectContext;
    nestedPrivateQueueContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    
    [nestedPrivateQueueContext performBlockAndWait:^{
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:nestedPrivateQueueContext];
        person.personID = @"theID";
        Pet *pet = [NSEntityDescription insertNewObjectForEntityForName:@"Pet" inManagedObjectContext:nestedPrivateQueueContext];
        pet.name = @"Rufus";
        person.pet = pet;
        
        NSError *saveError;
        if (nestedPrivateQueueContext.hasChanges && ![nestedPrivateQueueContext save:&saveError]) {
            NSLog(@"%@", saveError);
        }
    }];
    
    NSError *saveError;
    if (self.childMainThreadManagedObjectContext.hasChanges && ![self.childMainThreadManagedObjectContext save:&saveError]) {
        NSLog(@"%@", saveError);
    }
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate saveContext];
}

@end
