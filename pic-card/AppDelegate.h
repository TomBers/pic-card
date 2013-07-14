//
//  AppDelegate.h
//  pic-card
//
//  Created by Tom Berman on 09/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactsViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ContactsViewController *viewController;

@end
