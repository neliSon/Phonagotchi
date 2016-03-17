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

@property (nonatomic) UIImageView *petImageView, *bucketImageView, *appleImageView;
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
    
    // Image view for basket
    
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    
    [self.view addSubview:self.bucketImageView];
    
    NSLayoutConstraint *bucketImageViewBottom = [NSLayoutConstraint constraintWithItem:self.bucketImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];

    NSLayoutConstraint *bucketImageViewLeft = [NSLayoutConstraint constraintWithItem:self.bucketImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *bucketImageViewWidth = [NSLayoutConstraint constraintWithItem:self.bucketImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    NSLayoutConstraint *bucketImageViewHeight = [NSLayoutConstraint constraintWithItem:self.bucketImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    [self.view addConstraints:@[bucketImageViewBottom, bucketImageViewLeft, bucketImageViewWidth, bucketImageViewHeight]];
    
    
    // apple image view
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    
    [self.view addSubview:self.appleImageView];
                                  
    NSLayoutConstraint *appleImageViewBottom = [NSLayoutConstraint constraintWithItem:self.appleImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-25.0];
    
    NSLayoutConstraint *appleImageViewLeft = [NSLayoutConstraint constraintWithItem:self.appleImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:25.0];
    
    NSLayoutConstraint *appleImageViewWidth = [NSLayoutConstraint constraintWithItem:self.appleImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *appleImageViewHeight = [NSLayoutConstraint constraintWithItem:self.appleImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.view addConstraints:@[appleImageViewBottom, appleImageViewLeft, appleImageViewWidth, appleImageViewHeight]];
    
    
    // Pan Gesture
    UIPanGestureRecognizer *petPet = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(petThePet:)];
    
    [self.petImageView addGestureRecognizer: petPet];
    
    // Pinch Gesture
    UIPinchGestureRecognizer *pickApple = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pickUpApple)];
    
}

- (IBAction)petThePet:(UIPanGestureRecognizer *)sender {
    
    if (sender.state != UIGestureRecognizerStateChanged) {
        return;
    }
    
    CGPoint vector = [sender velocityInView:self.petImageView];
    CGFloat velocity = sqrt(vector.x*vector.x + vector.y*vector.y);
    

    if (velocity > 500.0) {
        
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];

    }
}

- (IBAction)pickUpApple:(UIPinchGestureRecognizer *)sender {
    
}

@end
