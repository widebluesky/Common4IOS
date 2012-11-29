//
//  HP_PageFlowViewController.m
//  common4ios
//
//  Created by Yi Xu on 12-11-15.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_PageFlowViewController.h"

@interface HP_PageFlowViewController ()

@end

@implementation HP_PageFlowViewController
@synthesize hFlowView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageArray = [[NSArray alloc] initWithObjects:@"0.tiff",@"1.tiff",@"2.tiff",@"3.tiff",@"4.tiff",@"5.tiff",@"6.tiff",@"7.tiff",nil];
    
    hFlowView.delegate = self;
    hFlowView.dataSource = self;
    //    hFlowView.pageControl = hPageControl;
    hFlowView.minimumPageAlpha = 1;
    hFlowView.minimumPageScale = 0.9;
    
    hFlowView.orientation = HP_PageFlowViewOrientationHorizontal;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(HP_PageFlowView *)flowView;{
    return CGSizeMake(250, 350);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Datasource
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(HP_PageFlowView *)flowView{
    return [imageArray count];
}

//返回给某列使用的View
- (UIView *)flowView:(HP_PageFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    UIImageView *imageView = (UIImageView *)[flowView dequeueReusableCell];
    if (!imageView) {
        imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 6;
        imageView.layer.masksToBounds = YES;
    }
    imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:index]];
    return imageView;
}


@end
