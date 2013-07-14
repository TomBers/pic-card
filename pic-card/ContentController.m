//
//  ContentController.m
//  pic-card
//
//  Created by Tom Berman on 14/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import "ContentController.h"
#import "RootViewController.h"
#import "CameraViewController.h"
#import "LandingScreenViewController.h"

@implementation ContentController

- (void) awakeFromNib {
    
//    A List of View files to load
    self.contentList = [self.contentList arrayByAddingObject:@"LandingScreenViewController"];
    self.contentList = [self.contentList arrayByAddingObject:@"CameraViewController"];
    self.contentList = [self.contentList arrayByAddingObject:@"ContactsViewController"];
    
    self.RootViewController.contentList = self.contentList;
    
    
}

@end
