//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Betty Fung on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISTriviaTableViewController.h"
#import "FISLocationsTableViewController.h"
#import "FISAddLocationTableViewController.h"

@interface FISLocationsTableViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.locations.count;
}

-(void)viewWillAppear:(BOOL)animated{

    [self.tableView reloadData];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightDetailCell" forIndexPath:indexPath];
    
    FISLocation *location = self.store.locations[indexPath.row];

    cell.textLabel.text = location.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", location.trivia.count];    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"viewTrivia"]){
        
        FISTriviaTableViewController *triviaVC = (FISTriviaTableViewController *)segue.destinationViewController;
        
        NSIndexPath *selectedRow = [self.tableView indexPathForSelectedRow];
        FISLocation *selectedLocation = self.store.locations[selectedRow.row];
        
        triviaVC.location = selectedLocation;
        
    }
//    else if ([segue.identifier isEqualToString:@"addLocation"]){
//        
//        FISAddLocationTableViewController *addLocationVC = (FISAddLocationTableViewController *)segue.destinationViewController;
//        
//        
//    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
