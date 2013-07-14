//
//  RootViewController.m
//  pic-card
//
//  Created by Tom Berman on 14/07/2013.
//  Copyright (c) 2013 A & T Design. All rights reserved.
//

#import "ContentController.h"
#import "RootViewController.h"
#import "CameraViewController.h"
#import "LandingScreenViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray *viewControllers;

@end

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUInteger numberPages = self.contentList.count;
    
    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < numberPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    
    // a page is the width of the scroll view
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize =
    CGSizeMake(CGRectGetWidth(self.scrollView.frame) * numberPages, CGRectGetHeight(self.scrollView.frame));
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    
    self.pageControl.numberOfPages = numberPages;
//    self.pageControl.currentPage = 1;
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    [self loadScrollViewWithPage:2];
    }

- (void)loadScrollViewWithPage:(NSUInteger)page
{
    if (page >= self.contentList.count)
        return;
    
        // replace the placeholder if necessary
        UIViewController *controller = [self.viewControllers objectAtIndex:page];
        if ((NSNull *)controller == [NSNull null])
        {
//            controller = [[UIViewController alloc] initWithNibName:[self.contentList objectAtIndex:page]];
            
            controller = [[UIViewController alloc] initWithNibName:[self.contentList objectAtIndex:page] bundle:nil];
            [self.viewControllers replaceObjectAtIndex:page withObject:controller];
        }
        
        
        // add the controller's view to the scroll view
        if (controller.view.superview == nil)
        {
            CGRect frame = self.scrollView.frame;
            frame.origin.x = CGRectGetWidth(frame) * page;
            frame.origin.y = 0;
            controller.view.frame = frame;
            
            [self addChildViewController:controller];
            [self.scrollView addSubview:controller.view];
            [controller didMoveToParentViewController:self];
            
          
        }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PageControl:(id)sender {
}
@end
