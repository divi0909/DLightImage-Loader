//
//  DImageLoader.h
//
//  Created by Divyanshu Sharma on 25/01/16.
// I put my best to create this loader but as you all know nothing is perfect in this world.
// So please provide me information regarding to issues in this loader i will resolve them in future.
// Thanks and feel free to edit code of this loader.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DImageLoader : NSObject

@property(strong,nonatomic) UIImage *onImage;

@property(strong,nonatomic) UIImage *offImage;

-(void)setIncreaseFactor:(CGFloat)factor;

-(void)setAnimationDuration:(CGFloat)duration;

-(void)setupOnImage:(UIImage *)yourImage;

-(void)setupOffImage:(UIImage *)yourImage;

-(void)startLoaderOnView:(UIView *)lView;

-(void)stopLoader;


@end
