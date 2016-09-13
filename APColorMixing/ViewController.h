//
//  ViewController.h
//  APColorMixing
//
//  Created by Mac on 12/09/16.
//  Copyright © 2016 Akshay. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kAllUIElementHeight 60.0
#define kVerticalPadding 20.0
#define kHorizantalPadding 20.0
#define kHeightOfStatusBar 30.0
@interface ViewController : UIViewController
{
    CGFloat screenWidth;
    CGFloat screenHeight;
    UILabel *labelRed;
    UILabel *labelGreen;
    UILabel *labelBlue;
    UISlider *myBlueSlider;
    UISlider *myGreenSlider;
    UISlider *myRedSlider;
    UIView *backView;
    UIButton *buttonReset;

    
}


@end

