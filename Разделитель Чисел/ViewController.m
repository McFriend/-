//
//  ViewController.m
//  Расделитель Чисел
//
//  Created by George Sabanov on 11.12.14.
//  Copyright (c) 2014 George Sabanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSNumber* number;
    NSNumber*secondNumber;
    BOOL isReady;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.secondSearch.hidden = YES;
}
- (IBAction)searchAction:(id)sender {
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:self.inputField.text];
    isReady = NO;
    if (myNumber == 0 ||!myNumber){
        self.showLabel.text = @"Input integer";
        self.secondSearch.hidden = YES;

    }else{
        [self checkNumber:myNumber.intValue];
    }
    
    
}
- (IBAction)secondSearch:(id)sender {
    [self checkNumber:secondNumber.intValue];
    isReady = NO;
}
-(void)checkNumber:(int)numberChecked{
    
    
    for (int i = 2; i < numberChecked; i++)
    {
        if (!isReady) {
        
            Float32 y = numberChecked;
            y /= i;
            NSString* x = [ NSString stringWithFormat:@"%f", y];
            
//            NSLog(@"%@", x);
//            NSString *myString = [NSString stringWithFormat:@"%@", x];
        
            if ((float)y == (int)y) {
                isReady = YES;
                NSLog(@"%f, %d", y, i);
                self.showLabel.text = [NSString stringWithFormat:@"%d / %d = %d", numberChecked, i, (int)y];
                self.secondSearch.hidden = NO;
                secondNumber = @((int)y);
                
                
                
            }else{
                self.showLabel.text = @"Input INTEGER value";
                self.secondSearch.hidden = YES;

            }
        }
        if (!isReady) {
            NSLog(@"No decimals match");
            self.showLabel.text = @"No integer found";
            self.secondSearch.hidden = YES;

        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
