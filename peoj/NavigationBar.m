//
//  NavigationBar.m
//  peoj
//
//  Created by Bojana Sladojevic on 07/05/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar
@synthesize contentView,delegate;

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customInit];
    }
    
    return self;
}
-(void)customInit {
    
    [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
    
    [self addSubview:self.contentView];
    self.contentView.frame=self.bounds;
}

- (IBAction)backButton:(id)sender {
    
    if([self.delegate respondsToSelector:@selector(backButtonDelegate:)])
    {
        [self.delegate backButtonDelegate:self];
    }
        
    
}


- (IBAction)logOutButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(logOutButtonDelegate:)]) {
        [self.delegate logOutButtonDelegate:self];
    }
}

@end
