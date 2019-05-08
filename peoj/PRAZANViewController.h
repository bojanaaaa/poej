//
//  PRAZANViewController.h
//  peoj
//
//  Created by Bojana Sladojevic on 08/05/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface PRAZANViewController : BaseViewController <NavigationBarDelegate>

@property (strong, nonatomic) IBOutlet NavigationBar *navigationBar;

@end

NS_ASSUME_NONNULL_END
