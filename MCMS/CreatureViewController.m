//
//  CreatureViewController.m
//  MCMS
//
//  Created by Vala Kohnechi on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import "CreatureViewController.h"
@interface CreatureViewController () <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UITextField *creatureTextField;

@property (strong, nonatomic) IBOutlet UITextField *detailTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITableView *tableView2;


@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureTextField.alpha = 0;
    self.detailTextField.alpha = 0;
    self.creatureTextField.enabled = NO;
    self.detailTextField.enabled = NO;
    self.detailLabel.text = self.creature.detail;
    self.imageView.image = self.creature.image;
    self.accessoryArray = self.creature.accessories;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [self.tableView2 dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    cell.textLabel.text = self.accessoryArray[indexPath.row];


//    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    cell.textLabel.text = [self.creatures[indexPath.row] name];
//    cell.detailTextLabel.text = [self.creatures[indexPath.row] detail];
//    return cell;

    return cell;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self editButton:nil];
    return YES;
}
- (IBAction)editButton:(UIBarButtonItem *)sender
{
//    self.tableView.editing = !self.tableView.editing;
//    if (self.tableView.editing)
    if ([self.editButton.title isEqualToString:@"Edit"])
    {
        
        [self.editButton setTitle:@"Done"];
        self.creatureTextField.enabled = YES;
        self.detailTextField.enabled = YES;
        [UIView animateWithDuration:.2 animations:^{
            self.creatureTextField.alpha= 1;
            self.detailTextField.alpha = 1;
        }];
        
    }
    else
    {
        [self.editButton setTitle:@"Edit"];
        if (![self.creatureTextField.text isEqualToString:@""])
        {
            self.creature.detail = self.detailTextField.text;
            self.detailTextField.text = @"";
            self.detailTextField.enabled = NO;
            self.creature.name = self.creatureTextField.text;
            self.navigationItem.title = self.creatureTextField.text;
//            [self.creatureTextField resignFirstResponder];
            self.creatureTextField.text = @"";
            self.creatureTextField.enabled = NO;
            
        }
        [UIView animateWithDuration:.2 animations:^{
            self.creatureTextField.alpha= 0;
            self.detailTextField.alpha = 0;
        }];
        
        // [self.creatureTextField reloadData];   -- DO WE NEED THAT?
        
    }
  

}




@end
