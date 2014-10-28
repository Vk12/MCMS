//
//  ViewController.m
//  MCMS
//
//  Created by Vala Kohnechi on 10/28/14.
//  Copyright (c) 2014 Vala Kohnechi. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *dragon = [[MagicalCreature alloc] initWithName:@"Alexstrausa"];
    MagicalCreature *hobbit = [[MagicalCreature alloc] initWithName:@"Frodo"];
    MagicalCreature *elf = [[MagicalCreature alloc] initWithName:@"Legolas"];
    
    self.creatures = [@[dragon,hobbit,elf] mutableCopy];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.creatures[indexPath.row] name];
    return cell;
}

- (IBAction)addButton:(id)sender
{
    if (![self.textField.text isEqualToString:@""])
    {
        MagicalCreature *addCreature = [[MagicalCreature alloc]init];
        addCreature.name = self.textField.text;
        self.textField.text = @"";
    }
    
   
}









@end
