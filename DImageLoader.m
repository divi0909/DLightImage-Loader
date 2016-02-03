//
//  DImageLoader.m
//
//  Created by Divyanshu Sharma on 25/01/16.
// I put my best to create this loader but as you all know nothing is perfect in this world.
// So please provide me information regarding to issues in this loader i will resolve them in future.
// Thanks and feel free to edit code of this loader.


#import "DImageLoader.h"

@implementation DImageLoader
{
    UIImageView *imgBall1,*imgBall2,*imgBall3;
    
    UILabel *lblText;
    
    CGFloat widthFactor,HeightFactor;
    
    CGFloat screenWidth,screenHeight;
    
    CGFloat distanceFactor;
    
    NSInteger animIndex;
    
    CGFloat increaseFactor;
    
    CGFloat animDuration;
    
    BOOL stopAnimation,showText;
}
@synthesize onImage,offImage;

+(DImageLoader *)sharedInstance
{
    static DImageLoader *global = nil;
    static dispatch_once_t token = 0;
    dispatch_once(&token, ^{
        
        global = [[DImageLoader alloc]init];
        
    });
    
    return global;
}

-(id)init
{
    widthFactor = 9.375;
    HeightFactor = 6.25;
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        distanceFactor = window.frame.origin.x+((screenWidth*widthFactor)/100)/2+20;
    }
    else
    {
        distanceFactor = window.frame.origin.x+((screenWidth*widthFactor)/100)/2+10;
    }
    showText = NO;
    return [super init];
}

#pragma mark
#pragma mark-Manual Configuration Method

-(void)showText:(NSString *)text andFont:(UIFont *)font
{
    _text = text;
    _font = font;
}

-(void)setIncreaseFactor:(CGFloat)factor
{
    increaseFactor = factor;
}

-(void)setAnimationDuration:(CGFloat)duration
{
    animDuration = duration;
}

-(void)setupOnImage:(UIImage *)yourImage
{
    onImage = yourImage;
}

-(void)setupOffImage:(UIImage *)yourImage
{
    offImage = yourImage;
}

-(void)setDistanceFactor:(CGFloat)factor
{
    distanceFactor = factor;
}

-(void)hideText:(BOOL)choice
{
    showText = choice;
}
#pragma mark
#pragma mark-Show/Hide Method

-(void)startLoaderOnView:(UIView *)lView
{

    stopAnimation = NO;
    
    animIndex = 0;
    
    lView.alpha = 0.6;
    
    if(increaseFactor == 0.0)
    {
        increaseFactor = 1.3;
    }
    if(animDuration == 0.0)
    {
        animDuration = 0.3;
    }
    if(distanceFactor == 0.0)
    {
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            distanceFactor = 30.0f;
        }
        else
        {
            distanceFactor = 20.0f;
        }
    }
    
    if(!_text)
    {
        _text = @"Loading...";
    }
    
    if(!_font)
    {
        _font = [UIFont fontWithName:@"ChalkBoard SE" size:14];
    }
    
    CGFloat centreM = lView.center.x-((screenWidth*widthFactor)/100)/2;
    CGFloat centerP = lView.center.x+((screenWidth*widthFactor)/100)/2;
    
    if(!showText)
    {
        CGSize lblWidth = [_text sizeWithAttributes:@{NSFontAttributeName:_font}];

        lblText = [[UILabel alloc]initWithFrame:CGRectMake(centreM-lblWidth.width/2, lView.center.y-((screenHeight*HeightFactor)/100)/2-_font.lineHeight-10,lblWidth.width*1.5, _font.lineHeight)];
        
        if(_textColor)
        {
            lblText.textColor = _textColor;
        }
        
        lblText.textAlignment = NSTextAlignmentCenter;
        
        lblText.font = _font;
        
        lblText.text = _text;
        
        [lView insertSubview:lblText atIndex:[lView.subviews count]];
        
    }
    
    imgBall1 = [[UIImageView alloc]initWithFrame:CGRectMake(lView.center.x-distanceFactor-(screenWidth*widthFactor)/100, lView.center.y, (screenWidth*widthFactor)/100, (screenHeight*HeightFactor)/100)];
    
    imgBall2 = [[UIImageView alloc]initWithFrame:CGRectMake(lView.center.x-((screenWidth*widthFactor)/100)/2, lView.center.y, (screenWidth*widthFactor)/100, (screenHeight*HeightFactor)/100)];
    
    imgBall3 = [[UIImageView alloc]initWithFrame:CGRectMake(lView.center.x+distanceFactor, lView.center.y, (screenWidth*widthFactor)/100, (screenHeight*HeightFactor)/100)];
    
    imgBall1.layer.cornerRadius = imgBall1.frame.size.width/2;
    
    imgBall2.layer.cornerRadius = imgBall2.frame.size.width/2;
    
    imgBall3.layer.cornerRadius = imgBall3.frame.size.width/2;
    
    imgBall1.layer.masksToBounds = YES;
    
    imgBall2.layer.masksToBounds = YES;
    
    imgBall3.layer.masksToBounds = YES;
    
    [lView insertSubview:imgBall1 atIndex:[lView.subviews count]];

    [lView insertSubview:imgBall2 atIndex:[lView.subviews count]];

    [lView insertSubview:imgBall3 atIndex:[lView.subviews count]];
    
    [lView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(![obj isKindOfClass:[UIImageView class]])
        {
            obj.alpha = 0.7;
        }
        
    }];
    
    if(!onImage && !offImage)
    {
        imgBall1.backgroundColor = [UIColor lightGrayColor];
        imgBall2.backgroundColor = [UIColor lightGrayColor];
        imgBall3.backgroundColor = [UIColor lightGrayColor];
    }
    else
    {
        imgBall1.image = offImage;
        imgBall2.image = offImage;
        imgBall3.image = offImage;
    }
    
    [self starAnimatingImages];
}

-(void)stopLoaderOnView:(UIView *)lView
{
    [imgBall1 removeFromSuperview];
    [imgBall2 removeFromSuperview];
    [imgBall3 removeFromSuperview];
    [lblText removeFromSuperview];
    increaseFactor = 0.0;
    animDuration = 0.0;
    stopAnimation = YES;
    distanceFactor = 0.0;
    _text = @"Loading...";
    showText = YES;
    [lView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 1.0;
        
    }];

}


#pragma mark
#pragma mark-Private Methods

-(void)starAnimatingImages
{
    switch (animIndex) {
        case 0:
        {
            animIndex++;
            if(onImage)
            {
                imgBall1.image = onImage;
            }
            else
            {
                imgBall1.backgroundColor = [UIColor blueColor];
            }
            
            [UIView animateWithDuration:animDuration animations:^{
                
                imgBall1.transform = CGAffineTransformMakeScale(increaseFactor, increaseFactor);
                
            } completion:^(BOOL finished) {
                
                [UIView transitionWithView:imgBall1 duration:animDuration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    if(offImage)
                    {
                        imgBall1.image = offImage;
                    }
                    else
                    {
                        imgBall1.backgroundColor = [UIColor lightGrayColor];
                    }
                    imgBall1.transform = CGAffineTransformIdentity;
                    
                } completion:nil];
                if(!stopAnimation)
                {
                    [self starAnimatingImages];
                }
            }];
            
            break;
        }
        case 1:
        {
            animIndex++;
            
            if(onImage)
            {
                imgBall2.image = onImage;
            }
            else
            {
                imgBall2.backgroundColor = [UIColor blueColor];
            }
            
            [UIView animateWithDuration:animDuration animations:^{
                
                imgBall2.transform = CGAffineTransformMakeScale(increaseFactor, increaseFactor);
                
            } completion:^(BOOL finished) {
                
                [UIView transitionWithView:imgBall2 duration:animDuration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    if(offImage)
                    {
                        imgBall2.image = offImage;
                    }
                    else
                    {
                        imgBall2.backgroundColor = [UIColor lightGrayColor];
                    }
                    imgBall2.transform = CGAffineTransformIdentity;
                    
                } completion:nil];
                if(!stopAnimation)
                {
                    [self starAnimatingImages];
                }
            }];
            break;
        }
        case 2:
        {
            animIndex = 0;
            
            if(onImage)
            {
                imgBall3.image = onImage;
            }
            else
            {
                imgBall3.backgroundColor = [UIColor blueColor];
            }
            [UIView animateWithDuration:animDuration animations:^{
                
                imgBall3.transform = CGAffineTransformMakeScale(increaseFactor, increaseFactor);
                
            } completion:^(BOOL finished) {
                [UIView transitionWithView:imgBall3 duration:animDuration options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    if(offImage)
                    {
                        imgBall3.image = offImage;
                    }
                    else
                    {
                        imgBall3.backgroundColor = [UIColor lightGrayColor];
                    }
                    imgBall3.transform = CGAffineTransformIdentity;
                    
                } completion:nil];
                if(!stopAnimation)
                {
                    [self starAnimatingImages];
                }
            }];
            break;
        }
            
        default:
            break;
    }

}

@end
