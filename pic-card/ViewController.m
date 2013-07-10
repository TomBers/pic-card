//
//  ViewController.m
//  pic-card
//
//  Created by Tom Berman on 09/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
        CGRect fr = CGRectMake(navBarRect.origin.x,navBarRect.origin.y+navBarRect.size.height,navBarRect.size.width,100);
     
        eventTableView = [[UITableView alloc] initWithFrame:fr];
        eventTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        eventTableView.delegate = self;
        eventTableView.dataSource = self;
    
    [self.view addSubview:eventTableView];
    }
    else{
        NSLog(@"Found an old eventTableView - reusing him");
    }
    
}


#pragma mark - TableView DataSource Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == eventTableView) { // your tableView you had before
        return 1; // or other number, that you want
    }
    else{
        return 0;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    cell.backgroundView = [[UIView alloc] init];
    [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
    [[[cell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (tableView == eventTableView) { // your tableView you had before
        // ...
        cell.textLabel.text = @"Hi - I'm new here";
    }
    
    
    return cell;
}


@end
