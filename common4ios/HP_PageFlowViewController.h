//
//  HP_PageFlowViewController.h
//  common4ios
//
//  Created by Yi Xu on 12-11-15.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "HP_BaseViewController.h"
#import "HP_PageFlowView.h"

@interface HP_PageFlowViewController : HP_BaseViewController<HP_PageFlowViewDataSource,HP_PageFlowViewDelegate>{
    
    NSArray *imageArray;
    
}

@property (nonatomic, retain) IBOutlet HP_PageFlowView *hFlowView;

@end
