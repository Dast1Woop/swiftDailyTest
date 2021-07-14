//
//  TileOverlayViewController.m
//  OfficialDemo3D
//
//  Created by Li Fei on 3/3/14.
//  Copyright (c) 2014 songjian. All rights reserved.
//

#import "TileOverlayViewController.h"

#import "LocalTileOverlay.h"

//MARK: remote setting
//static NSString *const kTileOverlayRemoteServerTemplate = @"https://dev.indoormap.huatugz.com/xyztiles/a11y/{z}/{x}/{y}.png";

static NSString *const kTileOverlayRemoteServerTemplate = @"http://cache1.arcgisonline.cn/arcgis/rest/services/ChinaCities_Community_BaseMap_ENG/BeiJing_Community_BaseMap_ENG/MapServer/tile/{z}/{y}/{x}";

#define kTileOverlayRemoteMinZ      4
#define kTileOverlayRemoteMaxZ      20

//MARK: local setting
#define kTileOverlayLocalMinZ       11
#define kTileOverlayLocalMaxZ       13


@interface TileOverlayViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) MATileOverlay *tileOverlay;

@end

@implementation TileOverlayViewController

#pragma mark - Utility

- (MATileOverlay *)constructTileOverlayWithType:(NSInteger)type
{
    MATileOverlay *tileOverlay = nil;
    if (type == 0)
    {
        tileOverlay = [[LocalTileOverlay alloc] init];
        tileOverlay.minimumZ = kTileOverlayLocalMinZ;
        tileOverlay.maximumZ = kTileOverlayLocalMaxZ;

    }
    else // type == 1
    {
        tileOverlay = [[MATileOverlay alloc] initWithURLTemplate:kTileOverlayRemoteServerTemplate];
        
        /* minimumZ 是tileOverlay的可见最小Zoom值. */
        tileOverlay.minimumZ = kTileOverlayRemoteMinZ;
        /* minimumZ 是tileOverlay的可见最大Zoom值. */
        tileOverlay.maximumZ = kTileOverlayRemoteMaxZ;
        
        /* boundingMapRect 是用来 设定tileOverlay的可渲染区域. */
        tileOverlay.boundingMapRect = MAMapRectWorld;
    }
    
    return tileOverlay;
}

- (void)addTileOverlay
{
    /* 删除之前的楼层. */
    [self.mapView removeOverlay:self.tileOverlay];
    
    /* 添加新的楼层. */
    self.tileOverlay = [self constructTileOverlayWithType:1];
    
    [self.mapView addOverlay:self.tileOverlay];
}

#pragma mark - MAMapViewDelegate

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MATileOverlay class]])
    {
        MATileOverlayRenderer *renderer = [[MATileOverlayRenderer alloc] initWithTileOverlay:overlay];
        return renderer;
    }
    
    return nil;
}

- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction{
    NSLog(@"zoomLvl:%.1f", mapView.zoomLevel);
}

- (void)returnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(returnAction)];
    
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    
    self.mapView.zoomLevel = kTileOverlayLocalMaxZ;
    
    
    //控制是否可以旋转视角来显示3d效果
    self.mapView.rotateCameraEnabled = NO;
    
    //控制3d建筑是否显示
//    self.mapView.showsBuildings = NO;
    
    [self.view addSubview:self.mapView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self addTileOverlay];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

@end
