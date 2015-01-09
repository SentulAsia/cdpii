//
//  ViewController.m
//  cdpii
//
//  Created by saifuddin on 8/1/15.
//  Copyright (c) 2015 brainstorm. All rights reserved.
//

#import "ViewController.h"
#import "RDImageViewerController.h"
#import "UIImage+PDF.h"
#import "UIImage+PixelColor.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *tv;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tv.delegate = self;
    _tv.backgroundColor = [UIColor grayColor];
    _tv.dataSource = self;
    _tv.rowHeight = (self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.navigationController.navigationBar.frame.origin.y)/6;
    [self.view addSubview:_tv];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {return 6;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ident = @"ident";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 13, self.view.frame.size.width, _tv.rowHeight*0.6)];
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textAlignment = NSTextAlignmentCenter;
        lbl1.font = [UIFont boldSystemFontOfSize:50];
        lbl1.tag = 112;
        lbl1.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:lbl1];

        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(0, lbl1.frame.size.height + lbl1.frame.origin.y - 13, self.view.frame.size.width, _tv.rowHeight - lbl1.frame.size.height)];
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.tag = 113;
        lbl2.textAlignment = NSTextAlignmentCenter;
        lbl2.font = [UIFont boldSystemFontOfSize:17];
        lbl2.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:lbl2];
    }

    UILabel *lbl1 = (UILabel *)[cell.contentView viewWithTag:112];
    UILabel *lbl2 = (UILabel *)[cell.contentView viewWithTag:113];

    switch (indexPath.row)
    {
        case 0:
            lbl1.text = @"1";
            lbl2.text = @"The First 5 Years";
            break;
        case 1:
            lbl1.text = @"2";
            lbl2.text = @"Why Do We Review The Cdp";
            break;
        case 2:
            lbl1.text = @"3";
            lbl2.text = @"About Cdpii";
            break;
        case 3:
            lbl1.text = @"4";
            lbl2.text = @"Our Growth Target";
            break;
        case 4:
            lbl1.text = @"5";
            lbl2.text = @"Strategies Trust & Initiatives";
            break;
        case 5:
            lbl1.text = @"6";
            lbl2.text = @"The 5 Big Moves & Spatial Development Plan";
            break;
        default:
            break;
    }
    cell.contentView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+1]]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RDImageViewerController *viewController;
    viewController = [[RDImageViewerController alloc] initWithImageHandler:^UIImage *(NSInteger pageIndex) {
        NSString *imageName = [NSString stringWithFormat:@"%ld.%ld.pdf", indexPath.row + 1, (long)pageIndex + 1];
        UIImage *img = [UIImage originalSizeImageWithPDFNamed:imageName];
        return img;
    } numberOfImages:3 direction:RDPagingViewDirectionRight];
//    [viewController setBackgroundColor:[self colorMappingForPage:indexPath.row+1]];
//    viewController.showSlider = YES;
    viewController.showPageNumberHud = YES;
    viewController.landscapeMode = RDImageScrollViewResizeModeAspectFit;
    viewController.preloadCount = 1;
    viewController.hidesBottomBarWhenPushed = YES;
    [viewController setBackgroundColor:[self colorMappingForPage:indexPath.row+1]];
    [self.navigationController pushViewController:viewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIColor *)colorMappingForPage:(NSInteger)page
{
    switch (page)
    {
        case 1:
            return [UIColor colorWithRed:232.0f/255.0f green:227.0f/255.0f blue:196.0f/255.0f alpha:1.0];
            break;
        case 2:
            return [UIColor colorWithRed:223.0f/255.0f green:222.0f/255.0f blue:220.0f/255.0f alpha:1.0];
            break;
        case 3:
            return [UIColor colorWithRed:255.0f/255.0f green:251.0f/255.0f blue:254.0f/255.0f alpha:1.0];
            break;
        case 4:
            return [UIColor colorWithRed:232.0f/255.0f green:227.0f/255.0f blue:196.0f/255.0f alpha:1.0];
            break;
        case 5:
            return [UIColor colorWithRed:213/255.0f green:232/255.0f blue:239.0f alpha:1.0];
            break;
        case 6:
            return [UIColor colorWithRed:174.0f/255.0f green:209.0f/255.0f blue:166.0f/255.0f alpha:1.0];
            break;
        default:
            return [UIColor blackColor];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
