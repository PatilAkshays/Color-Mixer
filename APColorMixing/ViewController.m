//
//  ViewController.m
//  APColorMixing
//
//  Created by Mac on 12/09/16.
//  Copyright © 2016 Akshay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    screenHeight = [[UIScreen mainScreen]bounds].size.height;
    
    screenWidth =[[UIScreen mainScreen]bounds].size.width;
    
    
    backView = [[UIView alloc]initWithFrame:CGRectMake(0, kHeightOfStatusBar,screenWidth, screenHeight-30)];
    
    [backView setBackgroundColor:[UIColor blackColor]];
    
    backView.layer.borderColor = [[UIColor whiteColor]CGColor];
    
    backView.layer.borderWidth = 3;
    
    [self.view addSubview:backView];
    

    labelBlue = [[UILabel alloc]initWithFrame:CGRectMake(kHorizantalPadding, screenHeight-(4*kVerticalPadding), kAllUIElementHeight, kAllUIElementHeight)];
    

    
    labelBlue.backgroundColor = [UIColor blueColor];
    
    labelBlue.layer.borderColor = [UIColor whiteColor].CGColor;
    
    labelBlue.layer.borderWidth = 3;
    
    labelBlue.layer.cornerRadius = 15;

    
    [labelBlue setTextAlignment:NSTextAlignmentCenter];
    
    
    
    [self.view addSubview:labelBlue];
    
    myBlueSlider = [[UISlider alloc]initWithFrame:CGRectMake(screenWidth-300, screenHeight-(4*kVerticalPadding), 275, 50)];
    
    myBlueSlider.minimumValue = 0;
    
    myBlueSlider.maximumValue = 1;
    
    myBlueSlider.value =0;
    
    
    myBlueSlider.tintColor = [UIColor blueColor];
    
    myBlueSlider.thumbTintColor = [UIColor whiteColor];
    
    
    [myBlueSlider addTarget:self action:@selector(handelBlueSlider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:myBlueSlider];
    

    
    labelGreen = [[UILabel alloc]initWithFrame:CGRectMake(kHorizantalPadding, screenHeight-(8*kVerticalPadding), kAllUIElementHeight, kAllUIElementHeight)];
    
    labelGreen.backgroundColor = [UIColor greenColor];
    
    labelGreen.layer.borderColor = [UIColor whiteColor].CGColor;
    
    labelGreen.layer.borderWidth = 3;
    
    labelGreen.layer.cornerRadius = 15;
    

    
    [labelGreen setTextAlignment:NSTextAlignmentCenter];

    
    [self.view addSubview:labelGreen];
    
    myGreenSlider = [[UISlider alloc]initWithFrame:CGRectMake(screenWidth-300, screenHeight-(8*kVerticalPadding), 275, 50)];
    
    myGreenSlider.minimumValue = 0;
    
    myGreenSlider.maximumValue = 1;
    
    myGreenSlider.value =0;
    
    myGreenSlider.tintColor = [UIColor greenColor];
    
    myGreenSlider.thumbTintColor = [UIColor whiteColor];
    
    [myGreenSlider addTarget:self action:@selector(handelGreenSlider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:myGreenSlider];
    
    
    labelRed = [[UILabel alloc]initWithFrame:CGRectMake(kHorizantalPadding, screenHeight-(12*kVerticalPadding), kAllUIElementHeight, kAllUIElementHeight)];
    
    labelRed.backgroundColor = [UIColor redColor];
    
    labelRed.layer.borderColor = [UIColor whiteColor].CGColor;
    
    labelRed.layer.borderWidth = 3;
    
    labelRed.layer.cornerRadius = 15;
    
    [labelRed setTextAlignment:NSTextAlignmentCenter];

    
    [self.view addSubview:labelRed];
    
    myRedSlider = [[UISlider alloc]initWithFrame:CGRectMake(screenWidth-300, screenHeight-(12*kVerticalPadding), 275, 50)];
    
    myRedSlider.minimumValue = 0;
    
    myRedSlider.maximumValue = 1;
    
    myRedSlider.value =0;
    
    
    myRedSlider.tintColor = [UIColor redColor];
    
    myRedSlider.thumbTintColor = [UIColor whiteColor];
    
    [myRedSlider addTarget:self action:@selector(handelRedSlider:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:myRedSlider];
    
    
    CGRect resetButtonFrame = CGRectMake(kHorizantalPadding, screenHeight-320, kAllUIElementHeight+5, kAllUIElementHeight+5);
    
    buttonReset = [[UIButton alloc]initWithFrame:resetButtonFrame];
    
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    
    buttonReset.titleLabel.font = [UIFont systemFontOfSize:18];
    
    [buttonReset setTitle:@"RESETING..." forState:UIControlStateHighlighted];
    
    [buttonReset setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    buttonReset.layer.cornerRadius = 30;
    
    [buttonReset setBackgroundColor:[UIColor whiteColor]];
    
    buttonReset.layer.borderColor =[UIColor blackColor].CGColor;
    
    buttonReset.layer.borderWidth = 3;
    
    [buttonReset addTarget:self action:@selector(handlerReset) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonReset];
    

    
    
    
}

-(void)handelBlueSlider:(id) sender {
    
    //type convert
    UISlider *localBlueSlider = sender;

    
    NSLog(@"%f",localBlueSlider.value);
    
  //  self->backView.backgroundColor = [UIColor blueColor];

    
    labelBlue.text = [NSString stringWithFormat:@"%.02f",localBlueSlider.value];
    [self colorMe];

}

-(void)handelGreenSlider:(id) sender {
    
    //type convert
    UISlider *localGreenSlider = sender;
    
    
    NSLog(@"%f",localGreenSlider.value);
    
   // self->backView.backgroundColor = [UIColor greenColor];

    
    labelGreen.text = [NSString stringWithFormat:@"%.02f",localGreenSlider.value];
    [self colorMe];

}
-(void)handelRedSlider:(id) sender {
    
    //type convert
    UISlider *localRedSlider = sender;
    
    
    NSLog(@"%f",localRedSlider.value);
    
  //  self->backView.backgroundColor = [UIColor redColor];
  
    labelRed.text = [NSString stringWithFormat:@"%.02f",localRedSlider.value];
    
    [self colorMe];
    
}

-(void)colorMe {
    self->backView.backgroundColor = [UIColor colorWithRed:myRedSlider.value green:myGreenSlider.value blue:myBlueSlider.value alpha:1];
}

-(void)handlerReset{
    
    myRedSlider.value = 0;
    myBlueSlider.value = 0;
    myGreenSlider.value = 0;
    self->backView.backgroundColor = [UIColor grayColor];
    labelRed.text = [NSString stringWithFormat:@"0.00"];
    labelBlue.text = [NSString stringWithFormat:@"0.00"];
    labelGreen.text = [NSString stringWithFormat:@"0.00"];

   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
