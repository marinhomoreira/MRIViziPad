//
//  ASEViewController.m
//  MRIViewer
//
//  Created by Arlo Louis O'Keeffe on 10/27/12.
//  Modified by Marinho Moreira on 10/28/12.
//  Copyright (c) 2012 ASE Group. All rights reserved.
//

#import "ASEViewController.h"

@interface ASEViewController ()

@property (weak, nonatomic) IBOutlet UIView *tapView;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ASEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapInView:(UITapGestureRecognizer *)sender {
    CGPoint loc = [sender locationInView:self.tapView];
    NSLog(@"Size of view %f x %f", self.tapView.bounds.size.width, self.tapView.bounds.size.height);
    NSLog(@"Recognized tap %f : %f", loc.x, loc.y);
    // Divide screen width per number of images to have the width of each clickable column.
    float widthTapImageColumn = self.tapView.bounds.size.width / 460;
    // Determine image's index to show on screen
    float mriSliceIndex = loc.x / widthTapImageColumn;
    NSLog(@"mriSliceIndex %f", mriSliceIndex);
    NSString *imageName = [NSString stringWithFormat: @"IM-0001-0%i.jpg", 540+(int)mriSliceIndex];
    NSLog(@"image file: %@", imageName);
    self.image.image = [UIImage imageNamed:imageName];
}

@end
