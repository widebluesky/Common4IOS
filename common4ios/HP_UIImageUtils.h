//
//  NSObject+HP_UIImageUtils.h
//  common4ios
//
//  Created by Yi Xu on 12-11-18.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HP_UIImageUtils:NSObject

+(UIImage *) getResizeImage:(UIImage *)image toSize:(CGSize) size;

+(UIImage *) getRoundCornerImage: (UIImage*) image withPixels: (int) pixels;

@end
