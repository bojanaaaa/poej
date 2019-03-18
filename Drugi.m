//
//  Drugi.m
//  peoj
//
//  Created by crazy on 3/11/19.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "Drugi.h"

@interface Drugi ()

@end

@implementation Drugi
@synthesize labela1, labela2,text1,text2;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Ovo je drugi view controller");

    
    text1.delegate = self;
    
    [text1 addTarget:self
              action:@selector(textFieldDidChange:)
    forControlEvents:UIControlEventEditingChanged];
    
    text2.delegate = self;
   
    [text2 addTarget:self
              action:@selector(textFieldDidChange:)
    forControlEvents:UIControlEventEditingChanged];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldDidChange:(UITextField *)textField {
    labela2.text=text1.text;
   labela1.text=text2.text;}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
