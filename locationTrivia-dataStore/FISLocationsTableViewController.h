//
//  FISLocationsTableViewController.h
//  locationTrivia-dataStore
//
//  Created by Betty Fung on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocationsDataStore.h"

@interface FISLocationsTableViewController : UITableViewController

@property (strong, nonatomic) FISLocationsDataStore *store; 

@end
