//
//  TableSearchViewController.m
//  List Search
//
//  Created by Giles Van Gruisen on 3/13/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

#import "TableSearchViewController.h"

@interface TableSearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *unitedStates;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation TableSearchViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.tableView = [UITableView new];
        self.tableView.allowsSelection = NO;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"StateCell"];
        self.unitedStates = @[@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
        self.items = [self.unitedStates mutableCopy];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.searchBar = [UISearchBar new];
    self.searchBar.delegate = self;
    CGRect searchFrame = self.searchBar.frame;
    searchFrame.origin.y = 64.0;
    searchFrame.size.width = self.view.frame.size.width;
    searchFrame.size.height = 44.0;
    self.searchBar.frame = searchFrame;
    
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"United States"];

    navigationBar.items = @[navigationItem];
    
    CGFloat navigationHeight = navigationBar.frame.size.height + self.searchBar.frame.size.height;
    
    self.tableView.frame = CGRectMake(0, navigationHeight, self.view.frame.size.width, self.view.frame.size.height - navigationHeight);

    [self.view addSubview:self.tableView];
    [self.view addSubview:navigationBar];
    [self.view addSubview:self.searchBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"StateCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
        self.items = [self.unitedStates filteredArrayUsingPredicate:predicate];
    } else {
        self.items = self.unitedStates;
    }
    [self.tableView reloadData];
}


@end
