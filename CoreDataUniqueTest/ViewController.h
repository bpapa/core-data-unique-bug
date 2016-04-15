//
//  ViewController.h
//  CoreDataUniqueTest
//
//  Created by Brian Papa on 4/13/16.
//  Copyright © 2016 theskimm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSManagedObjectContext *rootManagedObjectContext;

- (IBAction)buttonTapped:(id)sender;

@end

