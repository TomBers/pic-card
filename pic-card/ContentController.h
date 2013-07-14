//
//  ContentController.h
//  pic-card
//
//  Created by Tom Berman on 14/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ContentController.h"

@class RootViewController;

@interface ContentController : NSObject
@property (nonatomic, strong) NSArray *contentList;
@property (weak, nonatomic) IBOutlet RootViewController *RootViewController;

@end
