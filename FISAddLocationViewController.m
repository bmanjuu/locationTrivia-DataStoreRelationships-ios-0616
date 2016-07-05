//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Betty Fung on 7/4/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"
#import "FISLocationsTableViewController.h"

@interface FISAddLocationViewController ()

@property (strong, nonatomic) FISLocationsDataStore *dataStore;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameTextField.accessibilityIdentifier = @"nameField";
    self.nameTextField.accessibilityLabel = @"nameField";
    
    self.latitudeTextField.accessibilityIdentifier = @"latitudeField";
    self.latitudeTextField.accessibilityLabel = @"latitudeField";
    
    self.longitudeTextField.accessibilityLabel = @"longitudeField";
    self.longitudeTextField.accessibilityIdentifier = @"longitudeField";
    
    self.cancelButton.accessibilityIdentifier = @"cancelButton";
    self.cancelButton.accessibilityLabel = @"cancelButton";
    
    self.saveButton.accessibilityLabel = @"saveButton";
    self.saveButton.accessibilityIdentifier = @"saveButton";
    
    self.dataStore = [FISLocationsDataStore sharedLocationsDataStore]; 
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)saveTapped:(id)sender {
    
    FISLocation *newLocation = [[FISLocation alloc] init];
    
    newLocation.name = self.nameTextField.text;
    newLocation.latitude = [self.latitudeTextField.text floatValue];
    newLocation.longitude = [self.longitudeTextField.text floatValue];
    
    [self.dataStore.locations addObject:newLocation];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    FISLocationsTableViewController *updateLocations = (FISLocationsTableViewController *) segue.destinationViewController;
//    
//    
//    
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
