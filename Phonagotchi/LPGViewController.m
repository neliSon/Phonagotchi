//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
//@property (nonatomic) CGPoint startLocation, stopLocation;
//@property (nonatomic) CGFloat dx, dy, distance;

- (IBAction)petThePet:(id)sender;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    self.petImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    UIPanGestureRecognizer *petPet = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(petThePet:)];
    
    [self.petImageView addGestureRecognizer: petPet];
    
    
}

- (IBAction)petThePet:(UIPanGestureRecognizer *)sender {
    
    if (sender.state != UIGestureRecognizerStateChanged) {
        return;
    }
    
    CGPoint vector = [sender velocityInView:self.petImageView];
    CGFloat velocity = sqrt(vector.x*vector.x + vector.y*vector.y);
    

    if (velocity > 500.0) {
        NSLog(@"Grumpy");
    }
}

@end
