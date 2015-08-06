//
//  ViewController.m
//  test
//
//  Created by Preston Taukulis on 8/3/15.
//  Copyright (c) 2015 Preston Taukulis. All rights reserved.
//

#import "ViewController.h"
#import "Shape.h"

@interface ViewController ()
@property (strong, nonatomic)UIView *shape;
@end

@implementation ViewController{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    UIView *barrier;
    UIView *barrier2;
}

- (void)viewDidLoad {
    
    
    
    barrier = [[UIView alloc] initWithFrame:
              CGRectMake(0, 250, 130, 30)];
    barrier.backgroundColor = [UIColor redColor];
    [self.view addSubview:barrier];
    barrier2 = [[UIView alloc] initWithFrame:
               CGRectMake(260, 450, 130, 30)];
    barrier2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:barrier2];
    [self createShape];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)createShape {
    [self.shape removeFromSuperview];
    _shape = [[UIView alloc] initWithFrame:
              CGRectMake(100, 100, 100, 100)];
    _shape.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_shape];
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[_shape]];
    dispatch_async(dispatch_get_main_queue(),
                   ^{
                       [_animator addBehavior:_gravity];
                   });
    _collision = [[UICollisionBehavior alloc]
                  initWithItems:@[_shape]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    CGPoint leftEdge = CGPointMake(barrier2.frame.origin.x -
                                    barrier2.frame.size.width, barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier2"
                                fromPoint:barrier2.frame.origin
                                  toPoint:leftEdge];
//    CGPoint topEdge = CGPointMake(barrier2.frame.origin.x-
//                                  barrier2.frame.size.width , barrier2.frame.origin.y + barrier2.frame.size.height);
//    [_collision addBoundaryWithIdentifier:@"barrier2"
//                                fromPoint:barrier2.frame.origin
//                                  toPoint:topEdge];
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[_shape]];
    itemBehaviour.elasticity = 0.6;
    [_animator addBehavior:itemBehaviour];
}

- (IBAction)createBlockButton:(id)sender {
    [self createShape];
    
}
@end
