//
//  FISAddTriviaViewController.h
//  locationTrivia-dataStore
//
//  Created by Betty Fung on 7/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocation.h"
#import "FISTrivium.h"

@interface FISAddTriviaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addTriviaTextField;
@property (weak, nonatomic) IBOutlet UIButton *addTriviaCancel;
@property (weak, nonatomic) IBOutlet UIButton *addTriviaSave;

@property (strong, nonatomic) FISLocation *addNewTriviumLocation;


@end
