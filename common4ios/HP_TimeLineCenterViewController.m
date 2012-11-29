//
//  HP_TimeLineCenterViewController.m
//  common4ios
//
//  Created by Yi Xu on 12-11-27.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_TimeLineCenterViewController.h"

#import "HP_AnimationUtils.h"

#import "HP_UIView.h"
#import "HP_UIButton.h"

#import <AddressBook/AddressBook.h>

@interface HP_TimeLineCenterViewController ()

@end

@implementation HP_TimeLineCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) initData{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initUI];
	
}

-(void) initUI{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [scrollView setFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    [scrollView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    [scrollView setContentSize:CGSizeMake(MainWidth, MainHeight)];
    
    HP_UIView *centerLineView = [[HP_UIView alloc] init];
    [centerLineView setBackgroundColor:[UIColor grayColor]];
    [centerLineView setFrame:CGRectMake(MainWidth/2, 0, 2, scrollView.contentSize.height)];
    [scrollView addSubview:centerLineView];
    
    for (int i = 0; i<50; i++) {
        HP_UIView *cellView = [[HP_UIView alloc] init];
        
        int cellViewMarginTop = 15;
        
        int cellViewHeight = MainWidth/2-30;
        int cellViewWidth = MainWidth/2-30;
        
        HP_UIButton *roundButton = [[HP_UIButton alloc] init];
        [roundButton setImage:[UIImage imageNamed:@"background.jpg"] forState:UIControlStateNormal];
        roundButton.layer.cornerRadius = 10;
        roundButton.layer.masksToBounds = YES;


        if (i%2==0) {
            //左侧
            [cellView setBackgroundColor:[UIColor grayColor]];
//            [cellView setBackgroundImage:[UIImage imageNamed:@"background.jpg"]];
            [cellView setFrame:CGRectMake(15, 15 +cellViewMarginTop *i/2+cellViewWidth*i/2, cellViewWidth,cellViewWidth)];
            
            [scrollView setContentSize:CGSizeMake(MainWidth, MAX(MainHeight, 10 +cellViewMarginTop *i/2+cellViewWidth*i/2 + cellViewHeight + cellViewMarginTop))];
            
            [centerLineView setFrame:CGRectMake(MainWidth/2, 0, 2, scrollView.contentSize.height)];
            
            [roundButton setFrame:CGRectMake(MainWidth/2-10, 10 +cellViewMarginTop *i/2+cellViewWidth*i/2+cellViewHeight/2, 20, 20)];
            
            [scrollView addSubview:roundButton];
        }else{
            //右侧
            [cellView setBackgroundColor:[UIColor grayColor]];
//            [cellView setBackgroundImage:[UIImage imageNamed:@"background.jpg"]];
            [cellView setFrame:CGRectMake(MainWidth/2+15, 15+cellViewMarginTop *i/2+cellViewWidth*i/2, cellViewWidth,cellViewWidth)];
            
            [scrollView setContentSize:CGSizeMake(MainWidth, MAX(MainHeight, 10+cellViewMarginTop *i/2+cellViewWidth*i/2 + cellViewHeight + cellViewMarginTop))];
            
            [centerLineView setFrame:CGRectMake(MainWidth/2, 0, 2, scrollView.contentSize.height)];
            
            [roundButton setFrame:CGRectMake(MainWidth/2-10, 10+cellViewMarginTop *i/2+cellViewWidth*i/2+cellViewHeight/2, 20, 20)];
            [scrollView addSubview:roundButton];
        }
        cellView.layer.cornerRadius = 5;
        cellView.layer.borderColor = [[UIColor brownColor] CGColor];
        cellView.layer.borderWidth = 3;
        cellView.layer.masksToBounds= YES;
        [scrollView addSubview:cellView];
        

        
    }
    

    
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
