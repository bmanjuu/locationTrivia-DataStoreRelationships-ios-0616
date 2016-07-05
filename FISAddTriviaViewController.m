//
//  FISAddTriviaViewController.m
//  locationTrivia-dataStore
//
//  Created by Betty Fung on 7/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaViewController.h"

@interface FISAddTriviaViewController ()


@end

@implementation FISAddTriviaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addTriviaTextField.accessibilityLabel = @"Trivium TextField";
    self.addTriviaTextField.accessibilityIdentifier = @"Trivium TextField";
    
    self.addTriviaCancel.accessibilityIdentifier = @"Cancel Button";
    self.addTriviaCancel.accessibilityLabel = @"Cancel Button";
    
    self.addTriviaSave.accessibilityLabel = @"Save Button";
    self.addTriviaSave.accessibilityIdentifier = @"Save Button";
    
    // Do any additional setup after loading the view.
}

- (IBAction)cancelTapped:(id)sender {
    
    // [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)saveTapped:(id)sender {
    
    FISTrivium *newTrivium = [[FISTrivium alloc] initWithContent:self.addTriviaTextField.text likes:0];
    
    [self.addNewTriviumLocation.trivia addObject:newTrivium];
    
    // [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
