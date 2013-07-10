//
//  ViewController.h
//  pic-card
//
//  Created by Tom Berman on 09/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    UITableView *eventTableView;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *eventAddButton;

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

- (IBAction)addEvent:(id)sender;

@end
