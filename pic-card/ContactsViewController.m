//
//  ViewController.m
//  pic-card
//
//  Created by Tom Berman on 09/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   self.eventSectionData = [[NSMutableDictionary alloc] init]; // This would need to be an ivar
    
    self.eventData = [[NSMutableArray alloc] init];
    
    [self.eventSectionData setObject:self.eventData forKey:@"Events"];
        
        
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addEvent:(id)sender {
    
    if(eventTableView==nil){
        NSLog(@"eventTableView is nil - making a new one now");
        CGRect navBarRect = _navigationBar.frame;
        CGRect fr = CGRectMake(navBarRect.origin.x,navBarRect.origin.y+navBarRect.size.height,navBarRect.size.width,self.view.frame.size.height);
     
        eventTableView = [[UITableView alloc] initWithFrame:fr];
        eventTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        eventTableView.delegate = self;
        eventTableView.dataSource = self;
    
    [self.view addSubview:eventTableView];
        [self addRowToEventsTable:@"Event number: "];

    }
    else{
        NSLog(@"Found an old eventTableView - reusing him");
        [self addRowToEventsTable:@"Event number: "];
    }
    
}

- (void)addRowToEventsTable:(NSString *) rowText{
    
    int rows = [eventTableView numberOfRowsInSection:0];
    NSString *row = [NSString stringWithFormat:@"%@ %d",rowText,rows];
    [self.eventData addObject:row]; // add your object
    [eventTableView reloadData];

    
}

#pragma mark - TableView DataSource Implementation


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.eventSectionData allKeys] objectAtIndex:section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.eventSectionData count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *continent = [self tableView:tableView titleForHeaderInSection:section];
    return [[self.eventSectionData valueForKey:continent] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    NSString *continent = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    NSString *country = [[self.eventSectionData valueForKey:continent] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = country;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *continent = [self tableView:tableView titleForHeaderInSection:indexPath.section];
    NSString *country = [[self.eventSectionData
                          valueForKey:continent] objectAtIndex:indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"You selected %@!", country] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
