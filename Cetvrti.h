//
//  Cetvrti.h
//  peoj
//
//  Created by Bojana Sladojevic on 22/04/2019.
//  Copyright © 2019 crazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comments.h"
#import "NavigationBar.h"
NS_ASSUME_NONNULL_BEGIN

@interface Cetvrti : UIViewController <NavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email2;
@property (weak, nonatomic) IBOutlet UILabel *body;

@property (strong, nonatomic) IBOutlet NavigationBar *navigationBar;

@property (strong, nonatomic) IBOutlet UIImageView *uiImage;

- (IBAction)dothat:(id)sender;

//-(UIImage*)getData;
@property (strong, nonatomic) Comments *data;
@end

NS_ASSUME_NONNULL_END
