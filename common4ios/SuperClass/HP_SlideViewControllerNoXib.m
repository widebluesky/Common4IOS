//
//  HP_SlideViewController.m
//  blog
//
//  Created by Yi Xu on 12-11-25.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import "HP_SlideViewControllerNoXib.h"
#import "HP_AnimationUtils.h"
#import "HP_UIColorUtils.h"
#import "HP_AFNetWorkingUtils.h"
#import "HP_JSONUtils.h"
#import "HP_StringUtils.h"

#import "HP_UIView.h"
#import "HP_UILabel.h"
#import "HP_UIImageView.h"
#import "HP_UIButton.h"
#import "HP_UITableView.h"

#import "HP_DianDianConfig.h"

#import "HP_ArticleDAO.h"

#define GOLDEN_SECTION 1.0/0.618

#define SLIDE_WIDTH 320.0-50.0
#define SLIDE_DURATION .3

#define BLOG_INFO_HEIGHT 180
@interface HP_SlideViewControllerNoXib ()

@end
//DATA
BOOL isSlideOpen;
NSMutableArray *categoryArray;
NSMutableArray *postArray;
//UI
HP_UIView *backGroundView;
HP_UIView *slideView;
HP_UILabel *slideTitleLabel;
HP_UITableView *timeLineTableView;

@implementation HP_SlideViewControllerNoXib

-(void) initData{
    
    NSString *tag = @"Android";
    
    HP_ArticleDAO *articleDAO = [[HP_ArticleDAO alloc] init];
    
    [articleDAO getArticleArrayByTag:tag HTTPRequestSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        HP_JSONUtils *jsonUtils = [[HP_JSONUtils alloc] init];
        
        NSDictionary *jsonDictionary = [jsonUtils getDictionaryFromJSONString:operation.responseString encoding:NSUTF8StringEncoding];
        
        postArray =[[jsonDictionary objectForKey:@"response"] objectForKey:@"posts"];
        
//        NSLog(@"%@",jsonDictionary);
        
        for (NSDictionary *postDictionary in postArray) {
            NSLog(@"%@",[postDictionary objectForKey:@"title"]);
            NSLog(@"%@",[postDictionary objectForKey:@"postUrl"]);
            NSLog(@"%@",[postDictionary objectForKey:@"body"]);
            NSLog(@"%@",@"-------------------------------------");
        }
        
        [timeLineTableView reloadData];
        
    } HTTPRequestFailureBlock:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",operation.responseString);
        
    }];
    
    isSlideOpen = NO;
    categoryArray = [[NSMutableArray alloc] initWithObjects:@"google",@"android",@"Java",@"ios",@"美食",@"生活",@"Music",@"b",@"c", nil];
    
//    timeLineArray = [[NSMutableArray alloc] initWithObjects:@"google",@"android",@"Java",@"ios",@"美食",@"生活",@"Music",@"b",@"c", nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    [self initBackGroundView];//初始化背景View
    [self initSlideView];//初始化滑动View
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initBackGroundView{
    backGroundView = [[HP_UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
    //    [backGroundView setBackgroundImage:[UIImage imageNamed:@"background.jpg"]];
    [self.view addSubview:backGroundView];
    
    HP_UIView *blogInfoView = [[HP_UIView alloc] init];
    [blogInfoView setBackgroundImage:[UIImage imageNamed:@"background.jpg"]];
    [blogInfoView setFrame:CGRectMake(0, 0, SLIDE_WIDTH, BLOG_INFO_HEIGHT)];
    [backGroundView addSubview:blogInfoView];
    
    HP_UILabel *temperatureLabel = [[HP_UILabel alloc] init];
    [temperatureLabel setInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [temperatureLabel setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#AA000000"]];
    [temperatureLabel setFrame:CGRectMake(0, BLOG_INFO_HEIGHT-25, SLIDE_WIDTH, 25)];
    [temperatureLabel setText:@"Cloudy 54 ℃"];
    [temperatureLabel setTextColor:[HP_UIColorUtils colorWithHexString:@"#FFFFFFFF"]];
    [temperatureLabel setTextAlignment:NSTextAlignmentRight];
    [blogInfoView addSubview:temperatureLabel];
    
    HP_UIImageView *avatarImageView = [[HP_UIImageView alloc] init];
    [avatarImageView setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#000000"]];
    [avatarImageView setFrame:CGRectMake(20, BLOG_INFO_HEIGHT-60, 50, 50)];
    avatarImageView.layer.borderWidth = 1;
    avatarImageView.layer.borderColor = [[HP_UIColorUtils colorWithHexString:@"#CCFFFFFF"] CGColor];
    [blogInfoView addSubview:avatarImageView];
    
    HP_UIView *categoryView = [[HP_UIView alloc] init];
    [categoryView setBackgroundColor:[UIColor yellowColor]];
    [categoryView setFrame:CGRectMake(0,BLOG_INFO_HEIGHT, SLIDE_WIDTH, MainHeight-BLOG_INFO_HEIGHT)];
    
    int categoryButtonWidth = 40;
    int categoryButtonHeight = 40;
    
    int row = 0;
    
    for (int i = 0 ; i <[categoryArray count];i++) {
        NSString *categoryName = [categoryArray objectAtIndex:i];
        //宽270px 5个categoryButton 200px 间距10px
        int col = i%5;
        
        HP_UIButton *categoryButton = [HP_UIButton buttonWithType:UIButtonTypeCustom];
        
        if (row==0&&col==0) {
            [categoryButton setFrame:CGRectMake(15+col*categoryButtonWidth,10+row*categoryButtonHeight, categoryButtonWidth, categoryButtonHeight)];
            //            [categoryButton setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#CC000000"]];
            [categoryButton setImage:[UIImage imageNamed:@"background.jpg"] forState:UIControlStateNormal];
            [categoryButton setTitle:categoryName forState:UIControlStateNormal];
            [categoryView addSubview:categoryButton];
        }else if (row==0){
            [categoryButton setFrame:CGRectMake(15+10*col+col*categoryButtonWidth,10+row*categoryButtonHeight, categoryButtonWidth, categoryButtonHeight)];
            //            [categoryButton setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#CC000000"]];
            [categoryButton setImage:[UIImage imageNamed:@"background.jpg"] forState:UIControlStateNormal];
            [categoryButton setTitle:categoryName forState:UIControlStateNormal];
            [categoryView addSubview:categoryButton];
            if (col%5==4) row ++;
        }else{
            [categoryButton setFrame:CGRectMake(15+10*col+col*categoryButtonWidth,10+row*10+row*categoryButtonHeight, categoryButtonWidth, categoryButtonHeight)];
            //            [categoryButton setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#CC000000"]];
            [categoryButton setImage:[UIImage imageNamed:@"background.jpg"] forState:UIControlStateNormal];
            [categoryButton setTitle:categoryName forState:UIControlStateNormal];
            [categoryView addSubview:categoryButton];
            if (col%5==4) row ++;
        }
        
        [categoryButton setTag:i];
        [categoryButton addTarget:self action:@selector(doLoadTableViewByCategory:) forControlEvents:UIControlEventTouchUpInside];
    }
    [backGroundView addSubview:categoryView];
}

-(void) initSlideView{
    
    slideView = [[HP_UIView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, MainHeight)];
    [slideView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:slideView];
    
    HP_UIView *navigationView = [[HP_UIView alloc] init];
    [navigationView setBackgroundColor:[HP_UIColorUtils colorWithHexString:@"#CCFFFFFF"]];
    [navigationView setFrame:CGRectMake(0, 0, MainWidth, 45)];
    [slideView addSubview:navigationView];
    
    slideTitleLabel = [[HP_UILabel alloc] init];
    [slideTitleLabel setBackgroundColor:[UIColor clearColor]];
    [slideTitleLabel setFrame:CGRectMake(0, 0, MainWidth, 45)];
    [slideTitleLabel setText:@"Google"];
    [slideTitleLabel setTextAlignment:NSTextAlignmentCenter];
    //    [slideTitleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:25.0]];
    [navigationView addSubview:slideTitleLabel];
    
    HP_UIButton *slideButton = [HP_UIButton buttonWithType:UIButtonTypeRoundedRect];
    [slideButton setFrame:CGRectMake(3, 0, 45, 45)];
    [slideButton setTitle:@"Slide" forState:UIControlStateNormal];
    [slideButton addTarget:self action:@selector(doSlide) forControlEvents:UIControlEventTouchUpInside];
    [navigationView addSubview:slideButton];
    [slideView addSubview:navigationView];
    
    timeLineTableView = [[HP_UITableView alloc] init];
    [timeLineTableView setFrame:CGRectMake(0, 45, MainWidth, MainHeight-45)];
    [timeLineTableView setDelegate:self];
    [timeLineTableView setDataSource:self];
    [timeLineTableView setShowsVerticalScrollIndicator:NO];
    
//    [timeLineTableView setSeparatorColor:[UIColor colorWithPatternImage: [UIImage imageNamed:@"background.jpg"]]];
    [slideView addSubview:timeLineTableView];
    
}

-(void) doSlide{
    if (isSlideOpen) {
        [self slideClose];
    }else{
        [self slideOpen];
    }
    
    
}

-(void) slideOpen{
    isSlideOpen = YES;
    [HP_AnimationUtils doAnimationForView:slideView toX:MainWidth/2+SLIDE_WIDTH duration:SLIDE_DURATION];
}

-(void) slideClose{
    isSlideOpen = NO;
    [HP_AnimationUtils doAnimationForView:slideView toX:MainWidth/2 duration:SLIDE_DURATION];
}


-(void)doLoadTableViewByCategory:(id)sender{
    HP_UIButton *tempButton = sender;
    int index = tempButton.tag;
    NSString *categoryName = [categoryArray objectAtIndex:index];
    [self slideClose];
    slideTitleLabel.text = categoryName;
}

#pragma mark -
#pragma mark TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [postArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    int row = [indexPath row];
//    NSLog(@"%@",[timeLineArray objectAtIndex:row]);

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setFrame:CGRectMake(0, 0, MainWidth, 200)];

    HP_UIView *grayLineView = [[HP_UIView alloc] init];
    [grayLineView setBackgroundColor:[UIColor grayColor]];
    [grayLineView setFrame:CGRectMake(MainWidth-20,0 ,2,  200)];
    [cell addSubview:grayLineView];
    
    HP_UIButton *articleIconButton = [[HP_UIButton alloc] init];
    [articleIconButton setFrame:CGRectMake(MainWidth-30, 7, 20, 20)];
    [articleIconButton setImage:[UIImage imageNamed:@"background.jpg"] forState:UIControlStateNormal];
    articleIconButton.layer.cornerRadius = 10;
    articleIconButton.layer.masksToBounds = YES;
    [articleIconButton addTarget:self action:@selector(doAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell addSubview:articleIconButton];
    
    
    NSDictionary *postDictionary = [NSDictionary dictionaryWithDictionary:[postArray objectAtIndex:row]];
    
    HP_UILabel *articleTitleLabel = [[HP_UILabel alloc] init];
    [articleTitleLabel setBackgroundColor:[UIColor clearColor]];
    [articleTitleLabel setFrame:CGRectMake(5, 5, MainWidth-30, 21)];

    //自动折行设置
    articleTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    articleTitleLabel.numberOfLines = 0;

    if ([postDictionary objectForKey:@"title"] != nil) {
        [articleTitleLabel setText:[postDictionary objectForKey:@"title"]];
        
        UIFont *font = articleTitleLabel.font;
//      CGSize titleSize = [[postDictionary objectForKey:@"title"] sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
        
        CGSize titleSize = [HP_StringUtils getTextSizeByString:[postDictionary objectForKey:@"title"] byFont:font bySize:CGSizeMake(articleTitleLabel.frame.size.width, MAXFLOAT)];
        
//        NSLog(@"%f",titleSize.width);
//        NSLog(@"%f",titleSize.height);
        
        [articleTitleLabel setFrame:CGRectMake(5, 5, titleSize.width, titleSize.height)];
    }else{
        [articleTitleLabel setText:@"null"];
    }
    

    [cell addSubview:articleTitleLabel];

    
//    NSLog(@"%@",);
    
    HP_UILabel *articleBodyLabel = [[HP_UILabel alloc] init];
    [articleBodyLabel setBackgroundColor:[UIColor clearColor]];
    [articleBodyLabel setFrame:CGRectMake(0, 20, MainWidth-30, 21)];
    
    //自动折行设置
    articleBodyLabel.lineBreakMode = UILineBreakModeWordWrap;
    articleBodyLabel.numberOfLines = 0;
    
    if ([postDictionary objectForKey:@"body"] != nil) {
        [articleBodyLabel setText:[postDictionary objectForKey:@"body"]];
        
        UIFont *font = articleBodyLabel.font;
        //      CGSize titleSize = [[postDictionary objectForKey:@"title"] sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
        
        CGSize titleSize = [HP_StringUtils getTextSizeByString:[postDictionary objectForKey:@"body"] byFont:font bySize:CGSizeMake(articleBodyLabel.frame.size.width, MAXFLOAT)];
        
        [articleBodyLabel setFrame:CGRectMake(5, 20, titleSize.width, titleSize.height)];
        
    }else{
        [articleBodyLabel setText:@"null"];
    }
    
    [cell addSubview:articleBodyLabel];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) doAnimation:(id)sender{
    
    HP_UIView *view = [[HP_UIView alloc] init];
    [view setFrame:CGRectMake(MainWidth, 45, 0, 0)];
    [view setAlpha:0.0];
    [slideView addSubview:view];
    
    [HP_AnimationUtils doAnimationForView:view duration:2 AnimationBlock:^{
        view.frame = CGRectMake(0, 0, MainWidth, MainHeight);
        view.alpha = 1.0;
        view.transform=CGAffineTransformIdentity;
        view.transform=CGAffineTransformMakeRotation(-M_PI);
        
        [view setBackgroundColor:[UIColor grayColor]];
        
    } AnimationCompletionBlock:^(BOOL finished) {
        [HP_AnimationUtils doAnimationForView:view fromAlpha:1.0 toAlpha:0 duration:.3];
        
    }];
    

}



@end
